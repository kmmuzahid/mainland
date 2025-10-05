import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

class AlreadyAccountRichText extends StatelessWidget {
  const AlreadyAccountRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: AppString.alreadyHaveAccount,
            style: AppTextStyles.titleMedium?.copyWith(color: AppColors.outlineColor),
          ),

          /// Sign Up Button here
          TextSpan(
            text: ' ${AppString.signIn}',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                appRouter.replace(
                  SignInRoute(
                    ctrUsername: TextEditingController(),
                    ctrPassword: TextEditingController(),
                  ),
                );
              },
            style: AppTextStyles.titleMedium?.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
