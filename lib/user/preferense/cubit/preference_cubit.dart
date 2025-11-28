import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/main.dart';
import 'package:mainland/user/preferense/model/category_model.dart';
import 'package:mainland/user/preferense/model/sub_category_model.dart';

import 'preference_state.dart';

class PreferenceCubit extends SafeCubit<PreferenceState> {
  PreferenceCubit()
    : super(
        PreferenceState(
          selectedSubcategories: const {},
          isCategoryLoading: false,
          isSubcategoryLoading: false,
        ),
      );
  final DioService dioService = getIt<DioService>();

void selectSubcategory({required SubCategoryModel subcategory, required CategoryModel category}) {
    // Create a new map to avoid mutating the current state
    final Map<CategoryModel, List<SubCategoryModel>> updatedMap = Map.from(
      state.selectedSubcategories,
    );
    final currentSubcategories = List<SubCategoryModel>.from(updatedMap[category] ?? []);

    // Toggle the subcategory
    if (currentSubcategories.contains(subcategory)) {
      currentSubcategories.remove(subcategory);
    } else {
      // Check if we've reached the maximum allowed subcategories for this category
      if (currentSubcategories.length >= 3) {
        showSnackBar(
          'You can select maximum 3 subcategories per category',
          type: SnackBarType.warning,
        );
      return;
    }
      currentSubcategories.add(subcategory);
    }

    // Update the map - remove the category if subcategories list is empty
    if (currentSubcategories.isEmpty) {
      updatedMap.remove(category);
    } else {
      updatedMap[category] = currentSubcategories;
  }

    // Emit the new state
    emit(state.copyWith(selectedSubcategories: updatedMap));
  }

  Future<void> fetchCategory() async {
    emit(state.copyWith(isCategoryLoading: true));
    final response = await dioService.request<Map<CategoryModel, List<SubCategoryModel>>>(
      input: RequestInput(endpoint: ApiEndPoint.instance.category, method: RequestMethod.GET),
      responseBuilder: (data) {
        final categoryMap = (data as List).map((element) {
          final category = CategoryModel.fromMap(element);
          return MapEntry(category, <SubCategoryModel>[]);
        });
        return Map.fromEntries(categoryMap);
      },
    );
    emit(state.copyWith(isCategoryLoading: false));
    if (response.statusCode == 200) {
      emit(state.copyWith(data: response.data));
    }
  }

  Future<void> fetchSubcategory(String categoryId) async {
    emit(state.copyWith(isSubcategoryLoading: true));
    final response = await dioService.request<List<SubCategoryModel>>( 
      input: RequestInput(
        endpoint: ApiEndPoint.instance.subCategory(categoryId),
        method: RequestMethod.GET,
      ),
      responseBuilder: (data) {
        final categoryMap = (data as List).map((element) {
          final category = SubCategoryModel.fromMap(element);
          return category;
        }).toList();
        return categoryMap;
      },
    );
    emit(state.copyWith(isSubcategoryLoading: false));
    if (response.statusCode == 200) {
      //find category
      final category = state.data.keys.firstWhere((element) => element.id == categoryId);
      //update subcategories
      final Map<CategoryModel, List<SubCategoryModel>> updatedMap = Map.from(state.data);
      updatedMap[category] = response.data ?? [];
      emit(state.copyWith(data: updatedMap));
    }
  }


}
