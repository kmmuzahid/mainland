
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/auth/cubit/auth_state.dart';

import 'package:mainland/common/auth/widgets/already_accunt_rich_text.dart';
import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/common/auth/widgets/otp_verify_widget.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/button/common_radio_group.dart';
import 'package:mainland/core/component/other_widgets/common_dialog.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_date_input_text_field.dart';
import 'package:mainland/core/component/text_field/common_phone_number_text_filed.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/custom_form.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

class SignUpAllField extends StatelessWidget {
  const SignUpAllField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      builder: (BuildContext context, GlobalKey<FormState> formKey) => SingleChildScrollView(
        child: BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //upload image
                const CommonLogo().center,
                CommonText(
                  text: AppString.appName,
                  style: AppTextStyles.headlineSmall?.copyWith(color: AppColors.primaryColor),
                ).center,
                CommonText(
                  text: AppString.buySellKeepFavoriteTickets,
                  style: AppTextStyles.bodyLarge?.copyWith(fontStyle: FontStyle.italic),
                  alignment: MainAxisAlignment.center,
                ).center,
                20.height,
                CommonRadioGroup(
                  options: {'attendee': AppString.attendee, 'organizer': AppString.organizer},
                  onChanged: (value) {
                    final cubit = context.read<AuthCubit>();
                    cubit.onChangeSignUpModel(
                      cubit.state.signUpModel.copyWith(registrationType: value),
                    );
                  },
                  initialKey: 'attendee',
                  iconSize: 25.w,
                  itemSpacing: 50.w,
                  textStyle: AppTextStyles.titleMedium,
                ).center,
                18.height,

                /// User Name here
                CommonTextField(
                  borderColor: AppColors.disable,
                  backgroundColor: AppColors.disable,
                  prefixIcon: _requiredIcon(),
                  hintText: AppString.fullName,
                  validationType: ValidationType.validateFullName,
                  onSaved: (value, controller) {
                    final cubit = context.read<AuthCubit>();
                    cubit.onChangeSignUpModel(cubit.state.signUpModel.copyWith(fullName: value));
                  },
                ),

                /// User Email here
                10.height,
                CommonTextField(
                  borderColor: AppColors.disable,
                  backgroundColor: AppColors.disable,
                  prefixIcon: _requiredIcon(),
                  hintText: AppString.emailAddress,
                  validationType: ValidationType.validateEmail,
                  onSaved: (value, controller) {
                    final cubit = context.read<AuthCubit>();
                    cubit.onChangeSignUpModel(cubit.state.signUpModel.copyWith(email: value));
                  },
                ),
                10.height,
            
                /// User Phone here
                BlocSelector<AuthCubit, AuthState, DateTime?>(
                  selector: (state) => state.signUpModel.dateOfBirth,
                  builder: (context, date) {
                    final cubit = context.read<AuthCubit>();
                    return CommonDateInputTextField(
                      prefixIcon: _requiredIcon(),
                      borderColor: AppColors.disable,
                      backgroundColor: AppColors.disable,
                      onChanged: (date) {
                        cubit.onChangeSignUpModel(
                          cubit.state.signUpModel.copyWith(
                            dateOfBirth: DateTime.tryParse(date) ?? DateTime.now(),
                          ),
                        );
                      },
                      validation: (value) {
                        final result = InputHelper.validate(ValidationType.validateDate, value);
                        if (result != null) {
                          return result;
                        }
                     
                        if (value != null && value.isNotEmpty) {
                          final date = DateTime.tryParse(value);
                          if (date == null) {
                            return 'Invalid date';
                          }
                          if (!date.isBefore(
                            DateTime.now().subtract(const Duration(days: 18 * 365)),
                          )) {
                            return 'You must be at least 18 years old';
                          }
                        }
                        return null;
                      },
                      suffix: SizedBox(
                        width: 110.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.calendar_month_outlined, color: AppColors.primaryText),
                            CommonText(
                              enableBorder: true,
                              backgroundColor: AppColors.disable,
                              top: 1,
                              bottom: 1,
                              left: 5,
                              right: 5,
                              borderColor: AppColors.disable,
                              text: '${calculateAge(date)} Yrs',
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                      onSave: (date) {
                        final cubit = context.read<AuthCubit>();
                        cubit.onChangeSignUpModel(
                          cubit.state.signUpModel.copyWith(dateOfBirth: DateTime.tryParse(date)),
                        );
                      },
                    );
                  },
                ),
                10.height,
                CommonTextField(
                  prefixIcon: _requiredIcon(),
                  borderColor: AppColors.disable,
                  backgroundColor: AppColors.disable,
                  validationType: ValidationType.validatePassword,
                  hintText: AppString.newPassword,
                  onChanged: (value) {
                    final cubit = context.read<AuthCubit>();
                    cubit.onChangeSignUpModel(cubit.state.signUpModel.copyWith(password: value));
                  },
                ),
                10.height,
                CommonTextField(
                  prefixIcon: _requiredIcon(),
                  borderColor: AppColors.disable,
                  backgroundColor: AppColors.disable,
                  hintText: 'United States',
                  isReadOnly: true,
                  validationType: ValidationType.notRequired,
                  onSaved: (value, controller) {
                    final cubit = context.read<AuthCubit>();
                    cubit.onChangeSignUpModel(
                      cubit.state.signUpModel.copyWith(country: 'United States'),
                    );
                  },
                ),
                10.height,
                CommonTextField(
                  prefixIcon: _requiredIcon(),
                  borderColor: AppColors.disable,
                  backgroundColor: AppColors.disable,
                  hintText: AppString.state,
                  validationType: ValidationType.validateFullName,
                  onSaved: (value, controller) {
                    final cubit = context.read<AuthCubit>();
                    cubit.onChangeSignUpModel(cubit.state.signUpModel.copyWith(state: value));
                  },
                ),
                10.height,
                CommonTextField(
                  prefixIcon: _requiredIcon(),
                  borderColor: AppColors.disable,
                  backgroundColor: AppColors.disable,
                  hintText: AppString.city,
                  validationType: ValidationType.validateFullName,
                  onSaved: (value, controller) {
                    final cubit = context.read<AuthCubit>();
                    cubit.onChangeSignUpModel(cubit.state.signUpModel.copyWith(city: value));
                  },
                ),
                // All Text Filed here
                10.height,
                CommonTextField(
                  prefixIcon: _requiredIcon(),
                  borderColor: AppColors.disable,
                  backgroundColor: AppColors.disable,
                  hintText: AppString.city,
                  validationType: ValidationType.validatePhone,
                  onSaved: (value, controller) {
                    final cubit = context.read<AuthCubit>();
                    cubit.onChangeSignUpModel(cubit.state.signUpModel.copyWith(phone: value));
                  },
                ),
                30.height,

                // Submit Button Here
                CommonButton(
                  titleText: AppString.signUp,
                  onTap: () {
                    final cubit = context.read<AuthCubit>();
                    formKey.currentState?.save();
                    commonDialog(
                      context: context,
                      child: OtpVerifyWidget(
                        email: cubit.state.signUpModel.email,
                        onSuccess: () {
                          appRouter.popUntilRouteWithName(SignInRoute.name);
                        },
                      ),
                    );
                  },
                ).center,
                
                30.height,

                ///  Sign In Instruction here
                const AlreadyAccountRichText().center,
                50.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
  String calculateAge(DateTime? date) {
    if (date == null) return '0';
    final now = DateTime.now();
    int years = now.year - date.year;
    if (now.month < date.month || (now.month == date.month && now.day < date.day)) {
      years--;
    }
    if (years < 0) years = 0;
    return '$years';
  }

  Widget _requiredIcon() =>
      const CommonText(text: '*', color: AppColors.warning, fontSize: 20, top: 10);
}
