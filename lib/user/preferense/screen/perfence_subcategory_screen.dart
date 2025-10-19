import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart' show HomeRoute;
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/user/preferense/cubit/preference_cubit.dart';
import 'package:mainland/user/preferense/cubit/preference_state.dart';
import 'package:mainland/user/preferense/widgets/preference_header_wideget.dart';

@RoutePage()
class PerfenceSubcategoryScreen extends StatelessWidget {
  const PerfenceSubcategoryScreen({
    super.key,
    required this.backgroundColor,
    this.buttonTitle,
    required this.cubit,
    this.header,
  });
  final String? buttonTitle;
  final PreferenceCubit cubit;
  final Widget? header;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
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
              Expanded(child: _subCategoryBuilder()),
              Padding(
                padding: EdgeInsets.only(bottom: 80.w),
                child: CommonButton(
                  titleText: buttonTitle ?? 'Next',
                  onTap: () {
                    appRouter.replaceAll([const HomeRoute()]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _subCategoryBuilder() {
    return BlocBuilder<PreferenceCubit, PreferenceState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.data[state.selectedCategory!]?.length ?? 0,
          itemBuilder: (context, index) {
            final subCategory = state.data[state.selectedCategory!]![index];
            final isSelected = state.selectedSubcategories.contains(subCategory);
            return GestureDetector(
              onTap: () {
                cubit.selectSubcategory(subCategory);
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
                child: CommonText(text: subCategory, style: AppTextStyles.titleMedium),
              ),
            );
          },
        );
      },
    );
  }
}
