import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/other_widgets/common_dialog.dart';
import 'package:mainland/core/component/other_widgets/smart_list_loader.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

@RoutePage()
class ModifyFavoriteFanClub extends StatelessWidget {
  const ModifyFavoriteFanClub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: AppString.favorites, isCenterTitle: false),
      body: Column(
        children: [
          Expanded(
            child: SmartListLoader(
              itemCount: 20,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return Container(
                  height: 45.h,
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  padding: EdgeInsets.only(left: 16.w),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: AppColors.primary50,
                    border: Border.all(color: AppColors.primaryColor, width: 1.2.w),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      CommonText(text: 'Concerts (Artist)', style: AppTextStyles.titleMedium),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          //delete from favorite.
                          commonDialog(
                            isDismissible: true,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      IconButton(
                                        onPressed: appRouter.pop,
                                        icon: Icon(
                                          Icons.close,
                                          size: 20,
                                          color: AppColors.iconColorBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CommonText(
                                  text: AppString.confirmDelete,
                                  style: AppTextStyles.titleLarge,
                                ),
                                CommonText(
                                  text: AppString.confirmDeleteMessage,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  textColor: AppColors.greay400,
                                ),
                                20.height,
                                Row(
                                  children: [
                                    const Spacer(),
                                    CommonButton(titleText: AppString.confim, onTap: appRouter.pop),
                                    20.width,
                                    CommonButton(
                                      buttonColor: AppColors.disable,
                                      titleText: AppString.cancel,
                                      onTap: appRouter.pop,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                30.height,
                              ],
                            ),
                            context: context,
                          );
                        },
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.close, color: AppColors.iconColorBlack),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          10.height,
          CommonButton(
            titleText: AppString.confim,
            onTap: () {
              //update list
              appRouter.pop();
            },
          ),
          20.height,
        ],
      ),
    );
  }
}
