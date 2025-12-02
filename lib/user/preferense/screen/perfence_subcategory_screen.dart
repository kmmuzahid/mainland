import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/user/preferense/cubit/preference_cubit.dart';
import 'package:mainland/user/preferense/cubit/preference_state.dart';
import 'package:mainland/user/preferense/model/category_model.dart';
import 'package:mainland/user/preferense/model/sub_category_model.dart';
import 'package:mainland/user/preferense/widgets/preference_actions_widget.dart';
import 'package:mainland/user/preferense/widgets/preference_header_wideget.dart';

@RoutePage()
class PerfenceSubcategoryScreen extends StatelessWidget {
  const PerfenceSubcategoryScreen({
    super.key,
    required this.backgroundColor,
    this.buttonTitle,
    required this.cubit,
    this.header,
    this.successRoute,
    this.onSubscategoryTap,
    required this.category,
  });
  final String? buttonTitle;
  final PreferenceCubit cubit;
  final Widget? header;
  final Color backgroundColor;
  final PageRouteInfo<Object?>? successRoute;
  final CategoryModel category;
  final Function(CategoryModel category, SubCategoryModel subCategory)? onSubscategoryTap;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cubit.fetchSubcategory(category.id);
    });
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<PreferenceCubit, PreferenceState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: CommonAppBar(backgroundColor: backgroundColor),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: BlocProvider.value(
                value: cubit,
                child: Column(
                  children: [
                    PreferenceHeaderWideget(header: header),
                    Expanded(
                      child: cubit.state.isSubcategoryLoading
                          ? const Center(child: CircularProgressIndicator())
                          : _subCategoryBuilder(state),
                    ),
                    PreferenceActionsWidget(
                      cubit: cubit,
                      buttonTitle: buttonTitle,
                      successRoute: successRoute,
                      category: category,
                      state: state,
                      showAllActions: onSubscategoryTap == null,
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _subCategoryBuilder(PreferenceState state) {
    return ListView.builder(
      itemCount: state.data[category]?.length ?? 0,
      itemBuilder: (context, index) {
        final SubCategoryModel subCategory = state.data[category]![index];
        final isSelected = state.selectedSubcategories[category]?.contains(subCategory) ?? false;
        return GestureDetector(
          onTap: () {
            if (onSubscategoryTap != null) {
              onSubscategoryTap!(category, subCategory);
            } else {
              cubit.selectSubcategory(subcategory: subCategory, category: category);
            }
          },
          child: Container(
            height: 45.h,
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary50 : AppColors.disable,
              border: Border.all(
                color: isSelected ? AppColors.primaryColor : AppColors.disable,
                width: 1.2.w,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: CommonText(text: subCategory.title, style: AppTextStyles.titleMedium),
          ),
        );
      },
    );
  }
}
