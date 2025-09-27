import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/widgets/common_logo.dart';

import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

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
            180.height,
            const Center(child: CommonLogo()),
            50.height,
            CommonText(
              alignment: MainAxisAlignment.center,
              text: AppString.selectYourLanguage,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            10.height,
          ],
        ),
      ),
    );
  }
}
