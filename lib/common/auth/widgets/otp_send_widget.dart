import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/cubit/otp_cubit.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text_field/common_phone_number_text_filed.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

class OtpSend extends StatefulWidget {
  const OtpSend({super.key});

  @override
  State<OtpSend> createState() => _OtpSendState();
}

class _OtpSendState extends State<OtpSend> {
  late TextEditingController controller;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 24.h),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CommonPhoneNumberTextFiled(controller: controller, countryChange: (value) {}),
            ),
            12.height,

            CommonButton(
              titleText: AppString.otpSendButton,
              isLoading: false,
              buttonWidth: 160,
              buttonHeight: 40.h,
              titleSize: 12,
              titleWeight: FontWeight.w500,
              onTap: () {
                if (formKey.currentState?.validate() == true) {
                  context.read<OtpCubit>().sendOtp(controller.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
