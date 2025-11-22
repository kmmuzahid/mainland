// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:mainland/user/preferense/model/category_model.dart';
import 'package:mainland/user/preferense/model/sub_category_model.dart';

class PreferenceState extends Equatable {
  PreferenceState({
    required this.selectedSubcategories,
    required this.isCategoryLoading,
    required this.isSubcategoryLoading,
    this.data = const {},
  });

  final Map<CategoryModel, List<SubCategoryModel>> data;
  final bool isCategoryLoading;
  final bool isSubcategoryLoading;

  final Map<CategoryModel, List<SubCategoryModel>> selectedSubcategories;

  @override
  List<Object> get props => [
    selectedSubcategories,
    isCategoryLoading,
    isSubcategoryLoading,
    data.hashCode,
  ];

  PreferenceState copyWith({
    Map<CategoryModel, List<SubCategoryModel>>? selectedSubcategories,
    bool? isCategoryLoading,
    bool? isSubcategoryLoading,
    Map<CategoryModel, List<SubCategoryModel>>? data,
  }) {
    return PreferenceState(
      selectedSubcategories: selectedSubcategories ?? this.selectedSubcategories,
      isCategoryLoading: isCategoryLoading ?? this.isCategoryLoading,
      isSubcategoryLoading: isSubcategoryLoading ?? this.isSubcategoryLoading,
      data: data ?? this.data,
    );
  }
}
