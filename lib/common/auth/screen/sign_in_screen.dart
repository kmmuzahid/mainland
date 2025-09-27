import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import '../widgets/do_not_have_account_widget.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Sections Starts here
      appBar: AppBar(),

      /// Body Sections Starts here
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 58.w, vertical: 24.h),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Log In Instruction here
              60.height,
              const CommonLogo().center,
              50.height,

              /// Account Email Input here
              CommonText(text: AppString.phoneNumber, bottom: 8),

              CommonTextField(
                // prefixIcon: const Icon(Icons.mail),
                // textStyle: theme.textTheme.bodyMedium,
                hintText: AppString.phoneNumber,
                validationType: ValidationType.validatePhone,
              ),

              /// Account Password Input here
              CommonText(text: AppString.password, bottom: 8, top: 24),
              CommonTextField(
                // prefixIcon: const Icon(Icons.lock),
                validationType: ValidationType.validatePassword,
                hintText: AppString.password,
              ),

              /// Forget Password Button here
              GestureDetector(
                onTap: () {
                  appRouter.push(
                    OtpRoute(
                      onSuccess: () {
                        appRouter.push(ForgetPasswordRoute(formKey: GlobalKey()));
                      },
                    ),
                  );
                },
                child: CommonText(text: AppString.forgotThePassword, top: 10, bottom: 30),
              ).end,

              /// Submit Button here
              Align(
                child: CommonButton(
                  titleText: AppString.signIn,
                  onTap: () {
                    // if (formKey.currentState?.validate() == true) {
                    //   formKey.currentState?.save();
                    // }
                    // context.read<AuthCubit>().signIn(ctrUsername.text, ctrPassword.text);
                  },
                  buttonWidth: 132,
                  buttonHeight: 40,
                  isLoading: false,
                ),
              ),
              100.height,

              /// Account Creating Instruction here
              const Align(alignment: Alignment.bottomCenter, child: DoNotHaveAccount()),
              30.height,
            ],
          ),
        ),
      ),
    );
  }
}
