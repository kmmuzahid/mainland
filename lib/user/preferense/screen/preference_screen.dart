import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';
import 'package:mainland/user/preferense/cubit/preference_cubit.dart';

import '../cubit/preference_state.dart';

@RoutePage()
class PreferenceScreen extends StatelessWidget {
  const PreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(),
      body: BlocProvider<PreferenceCubit>(
        create: (context) => PreferenceCubit(),
        child: BlocBuilder<PreferenceCubit, PreferenceState>(
          builder: (context, state) {
            return Column(
              children: [
                const CommonLogo().center,
                CommonText(
                  text: AppString.appName,
                  style: AppTextStyles.headlineSmall?.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 20.sp,
                  ),
                ).center,
                SizedBox(height: 16.h),
                CommonText(
                  left: 16,
                  text: AppString.selectYourPreference,
                  style: AppTextStyles.headlineSmall?.copyWith(color: AppColors.primaryColor),
                ).start,
                CommonText(
                  left: 16,
                  text: AppString.eventsWillBeShownBasedOnYourPreferences,
                  style: AppTextStyles.bodyMedium,
                ).start,
                SizedBox(height: 20.h),
                Expanded(
                  child: state.selectedCategory == null
                      ? _categoryBuilder(state, context.read<PreferenceCubit>())
                      : _subCategoryBuilder(state, context.read<PreferenceCubit>()),
                ),
                if (state.selectedCategory != null)
                  Padding(
                    padding: EdgeInsets.only(bottom: 80.w),
                    child: CommonButton(
                      titleText: 'Next',
                      onTap: () {
                        appRouter.replaceAll([const HomeRoute()]);
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _categoryBuilder(PreferenceState state, PreferenceCubit cubit) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.4,
      ),
      itemCount: state.data.length,
      itemBuilder: (context, index) {
        final category = state.data.keys.elementAt(index);
        return GestureDetector(
          onTap: () {
            cubit.selectCategory(category);
          },
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.primary50,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                CommonImage(size: 74, imageSrc: Assets.images.preferenceIcon.path),
                Text(
                  category,
                  style: AppTextStyles.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _subCategoryBuilder(PreferenceState state, PreferenceCubit read) {
    return ListView.builder(
      itemCount: state.data[state.selectedCategory!]?.length ?? 0,
      itemBuilder: (context, index) {
        final subCategory = state.data[state.selectedCategory!]![index];
        final isSelected = state.selectedSubcategories.contains(subCategory);
        return GestureDetector(
          onTap: () {
            read.selectSubcategory(subCategory);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            height: 45.h,
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
  }
}
