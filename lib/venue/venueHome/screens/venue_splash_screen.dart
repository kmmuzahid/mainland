import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/other_widgets/common_dialog.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';

@RoutePage()
class VenueSplashScreen extends StatelessWidget {
  const VenueSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  appRouter.replaceAll([const HomeRoute()]);
                },
                icon: Icon(Icons.close, color: AppColors.iconColorBlack),
              ).end,
              50.height,
              CommonImage(
                fill: BoxFit.contain,
                imageSrc: Assets.icon.venueIcon.path,
                width: 108.w,
                height: 126.h,
              ),
              20.height,
              CommonText(
                text: AppString.insertEventCode,
                textColor: AppColors.primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              10.height,
              SizedBox(
                width: 250.w,
                child: CommonTextField(
                  controller: TextEditingController(),
                  validationType: ValidationType.validateRequired,
                ),
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonButton(
                    titleText: AppString.validate,
                    onTap: () {
                      appRouter.replaceAll([const VenueHomeRoute()]);
                    },
                  ),
                  20.width,
                  CommonButton(
                    buttonColor: AppColors.white400,
                    titleText: AppString.cancel,
                    onTap: () {
                      commonDialog(
                        isDismissible: true,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            28.height,
                            CommonText(
                              text: 'Exit',
                              fontWeight: FontWeight.w600,
                              textColor: AppColors.primaryColor,
                              fontSize: 24,
                            ),
                            CommonText(
                              fontWeight: FontWeight.w400,
                              top: 25,
                              bottom: 25,
                              fontSize: 18,
                              text: 'This will take you back to Mainland Home',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonButton(
                                  titleText: AppString.confim,
                                  onTap: () {
                                    appRouter.replaceAll([const HomeRoute()]);
                                  },
                                ),
                                20.width,
                                CommonButton(
                                  buttonColor: AppColors.white400,
                                  titleText: AppString.cancel,
                                  onTap: appRouter.pop,
                                ),
                              ],
                            ),
                            20.height,
                          ],
                        ),
                        context: context,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
