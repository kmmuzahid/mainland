import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/auth/cubit/auth_state.dart';
import 'package:mainland/common/auth/widgets/already_accunt_rich_text.dart';
import 'package:mainland/common/auth/widgets/common_logo.dart';
import 'package:mainland/common/show_info/cubit/info_state.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/button/common_radio_group.dart';
import 'package:mainland/core/component/city_state/common_city_dropdown.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/other_widgets/common_drop_down.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_date_input_text_field.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/custom_form.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/gen/assets.gen.dart';

import '../../../core/component/city_state/state_data.dart';

class SignUpAllField extends StatelessWidget {
  SignUpAllField({required this.state, super.key});
  final AuthState state;
  final List<MapEntry<String, String>> states = USA.states.map((e) => MapEntry(e, e)).toList()
    ..sort((a, b) => a.key.compareTo(b.key));   


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AuthCubit>(context),
      child: CustomForm(
        builder: (BuildContext context, GlobalKey<FormState> formKey) => SingleChildScrollView(
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final authCubit = context.read<AuthCubit>();
              return SingleChildScrollView(
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
                        authCubit.onChangeSignUpModel(registrationType: value);
                      },
                      initialKey: 'attendee',
                      iconSize: 25.w,
                      itemSpacing: 50.w,
                      textStyle: AppTextStyles.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: AppColors.greay400,
                      ),
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
                        authCubit.onChangeSignUpModel(name: value);
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
                        authCubit.onChangeSignUpModel(email: value);
                      },
                    ),
                    10.height,
                    CommonTextField(
                      prefixIcon: _requiredIcon(),
                      borderColor: AppColors.disable,
                      backgroundColor: AppColors.disable,
                      validationType: ValidationType.validatePassword,
                      hintText: AppString.password,
                      onChanged: (value) {
                        authCubit.onChangeSignUpModel(password: value);
                      },
                    ),
                    10.height,

                    /// User Phone here
                    _dateOfBirth(context, state),

                    10.height,
                    CommonTextField(
                      // prefixIcon: _requiredIcon(),
                      borderColor: AppColors.disable,
                      backgroundColor: AppColors.disable,
                      hintText: 'United States',
                      isReadOnly: true,
                      validationType: ValidationType.notRequired,
                      onSaved: (value, controller) {
                        authCubit.onChangeSignUpModel(country: 'United States');
                      },
                    ),
                    10.height,
                    CommonDropDown<MapEntry<String, String>>(
                      key: const Key('Location_united_states'),
                      hint: AppString.state,
                      prefix: _requiredIcon(),
                      fontStyle: FontStyle.italic,
                      items: states,
                      textStyle: AppTextStyles.bodyMedium,
                      borderColor: AppColors.disable,
                      initalValue: authCubit.state.profileModel?.address.street != null
                          ? selectedState(authCubit)
                          : null,
                      enableInitalSelection: false,
                      backgroundColor: AppColors.disable,
                      isRequired: true,
                      onChanged: (states) {
                        if (states != null) {
                          authCubit.onChangeSignUpModel(states: states.value);
                        }
                      },
                      nameBuilder: (states) {
                        return states.value;
                      },
                    ),
                    10.height,
                    CommonCityDropDown(
                      key: Key('Location${authCubit.state.signUpModel.state}'),
                      selectedState: authCubit.state.signUpModel.state,
                      selectedCountry: 'United States of America',
                      fontStyle: FontStyle.italic,
                      onChange: (value) {
                        authCubit.onChangeSignUpModel(city: value);
                      },
                    ), 
                    // All Text Filed here
                    10.height,
                    CommonTextField(
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonImage(width: 32, height: 24, imageSrc: Assets.images.usFlag.path),
                          10.width,
                          _requiredIcon(),
                        ],
                      ),
                      borderColor: AppColors.disable,
                      backgroundColor: AppColors.disable,
                      hintText: 'XXX-XXX-XXXX',
                      validationType: ValidationType.validatePhone,
                      onSaved: (value, controller) {
                        authCubit.onChangeSignUpModel(phone: value);
                      },
                    ),
                    30.height,

                    // Submit Button Here
                    CommonButton(
                      titleText: AppString.signUp,
                      isLoading: state.isLoading,
                      onTap: () {
                        formKey.currentState?.save();
                        if (formKey.currentState?.validate() == true) {
                          authCubit.signUp(authCubit.state.signUpModel);
                        }
                      },
                    ).center,

                    30.height,

                    ///  Sign In Instruction here
                    const AlreadyAccountRichText().center,
                    24.height,
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.labelSmall?.copyWith(color: AppColors.outlineColor),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => appRouter.push(
                                ShowInfoRoute(
                                  title: AppString.termsOfuse,
                                  infoType: InfoType.terms,
                                ),
                              ),
                            text: AppString.termsOfuse,
                            style: AppTextStyles.labelSmall?.copyWith(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColor,
                              decorationThickness: 2,
                            ),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => appRouter.push(
                                ShowInfoRoute(
                                  title: AppString.privacyNotice,
                                  infoType: InfoType.privacy,
                                ),
                              ),
                            text: AppString.privacyNotice,
                            style: AppTextStyles.labelSmall?.copyWith(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColor,
                              decorationThickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ).center,
                    60.height,
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  MapEntry<String, String> selectedState(AuthCubit authCubit) {
    final state = authCubit.state.profileModel?.address.street;
    return MapEntry(state!, state);
  }

  CommonDateInputTextField _dateOfBirth(BuildContext context, AuthState state) {
    final cubit = context.read<AuthCubit>();
    return CommonDateInputTextField(
      minDate: Utils.subtractYears(DateTime.now(), 140),
      maxDate: Utils.subtractYears(DateTime.now(), 18),
      prefixIcon: _requiredIcon(),
      borderColor: AppColors.disable,
      backgroundColor: AppColors.disable,
      isValidationRequired: true,
      onChanged: (date) {
        final finalDate = date ?? DateTime.now();
        AppLogger.debug(finalDate.toString());
        cubit.onChangeSignUpModel(dateOfBirth: finalDate);
        cubit.calculateAge(finalDate);
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
          if (!date.isBefore(DateTime.now().subtract(const Duration(days: 18 * 365)))) {
            return 'You must be at least 18 years old';
          }
        }
        return null;
      },
      suffix: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
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
                  text: '${state.age} Yrs',
                  style: TextStyle(color: AppColors.primaryText, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
      onSave: (date) {
        final cubit = context.read<AuthCubit>();
        final dateTime = date;
        if (dateTime != null) {
          cubit.onChangeSignUpModel(dateOfBirth: dateTime);
          cubit.calculateAge(dateTime);
        }
      },
    );
  }

  Widget _requiredIcon() =>
      const CommonText(text: '*', textColor: AppColors.warning, fontSize: 20, top: 10);
}
