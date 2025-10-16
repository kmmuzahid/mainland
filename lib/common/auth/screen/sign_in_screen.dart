import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/auth/model/user_login_info_model.dart';
import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/button/common_radio_group.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/custom_form.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import '../widgets/do_not_have_account_widget.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({required this.ctrUsername, required this.ctrPassword, super.key});

  final TextEditingController ctrUsername;
  final TextEditingController ctrPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Sections Starts here
      appBar: AppBar(),
      backgroundColor: AppColors.backgroundWhite,
      /// Body Sections Starts here
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: CustomForm(
          builder:(BuildContext context, GlobalKey<FormState> formKey)=> Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Log In Instruction here
              40.height,
              CommonText(
                text: AppString.letsSignYouIn,
                style: AppTextStyles.headlineLarge?.copyWith(color: AppColors.primaryColor),
              ),
              CommonText(
                textAlign: TextAlign.start,
                text: '${AppString.welcomeBack}\n${AppString.youHaveBeenMissed}',
                style: getTheme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
              20.height,
              CommonText(
                text: AppString.pleaseSelectARoleBeforeContinuing,
                style: getTheme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryText,
                ),
              ),
              15.height,
              CommonRadioGroup(
                options: {'attendee': AppString.attendee, 'organizer': AppString.organizer},
                onChanged: (value) {
                  context.read<AuthCubit>().onChangeUserRole(
                    value == 'organizer' ? Role.ORGANIZER : Role.ATTENDEE,
                  );
                },
                initialKey: 'attendee',
                iconSize: 25.w,
                textStyle: AppTextStyles.headlineSmall,
              ),
              20.height,

              CommonTextField(
                backgroundColor: AppColors.disable,
                borderColor: AppColors.disable,
                hintText: AppString.emailAddress,
                validationType: ValidationType.validateEmail,
                controller: ctrUsername,
              ),
              10.height,
              CommonTextField(
                backgroundColor: AppColors.disable,
                borderColor: AppColors.disable,
                hintText: AppString.password,
                validationType: ValidationType.validatePassword,
                controller: ctrPassword,
              ),

            
              /// Forget Password Button here
              GestureDetector(
                onTap: () {
                  appRouter.push(
                    OtpRoute(
                      onSuccess: () {
                        appRouter.push(
                          ForgetPasswordRoute(newPasswordController: TextEditingController()),
                        );
                      },
                    ),
                  );
                },
                child: CommonText(
                  text: AppString.forgotThePassword,
                  style: AppTextStyles.titleMedium?.copyWith(color: AppColors.primaryColor),
                  top: 10,
                  bottom: 30,
                ),
              ).end,

              /// Submit Button here
              Align(
                child: CommonButton(
                  titleText: AppString.signIn,
                  onTap: () {
                    // if (formKey.currentState?.validate() == true) {
                    //   formKey.currentState?.save();
                    // }
                    context.read<AuthCubit>().signIn(ctrUsername.text, ctrPassword.text);
                  },
                  buttonWidth: 100,
                  isLoading: false,
                ),
              ),
              24.height,

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
