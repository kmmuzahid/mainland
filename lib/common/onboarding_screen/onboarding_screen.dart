import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/image/common_image.dart';

import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            const Spacer(),
            CommonImage(imageSrc: Assets.icon.icon.path, width: 208, height: 142).center,
            CommonText(
              text: AppString.appName,
              style: getTheme.textTheme.headlineLarge?.copyWith(color: AppColors.primaryColor),
            ).center,
            CommonText(
              text: AppString.buySellKeepFavoriteTickets,
              style: getTheme.textTheme.bodyMedium,
            ).center,
            50.height,
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonButton(
                  titleText: AppString.signIn,
                  buttonWidth: 100,
                  onTap: () {
                    appRouter.push(
                      SignInRoute(
                        ctrUsername: TextEditingController(),
                        ctrPassword: TextEditingController(),
                      ),
                    );
                  },
                ),
                28.width,
                CommonButton(
                  titleText: AppString.signUp,
                  buttonWidth: 100,
                  onTap: () {
                    appRouter.push(
                      OtpRoute(
                        onSuccess: () {
                          appRouter.push(const SignUpRoute());
                        },
                      ),
                    );
                  },
                ),
                100.height,
              ],
            )
          ],
        ),
      ),
    );
  }
}
