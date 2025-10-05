import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/main.dart';

import 'preference_state.dart';

class PreferenceCubit extends SafeCubit<PreferenceState> {
  PreferenceCubit() : super(PreferenceState(selectedSubcategories: const []));

  void selectSubcategory(String subcategory) {
    if (state.selectedSubcategories.contains(subcategory)) {
      final List<String> updatedList = List.from(state.selectedSubcategories);
      updatedList.remove(subcategory);
      emit(state.copyWith(selectedSubcategories: updatedList));
      return;
    }
    if (state.selectedSubcategories.length > 2) {
      showSnackBar('You can select maximum 3 subcategories', type: SnackBarType.warning);
      return;
    }
    emit(state.copyWith(selectedSubcategories: [...state.selectedSubcategories, subcategory]));
  }

  void selectCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }
}
