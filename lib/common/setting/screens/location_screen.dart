import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/widgets/state_selector.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart'; 

@RoutePage()
class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            CommonText(
              textColor: AppColors.primaryColor,
              text: 'Location',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              bottom: 20,
            ).start,
            CommonTextField(
              prefixIcon: _requiredIcon(),
              borderColor: AppColors.disable,
              backgroundColor: AppColors.disable,
              hintText: 'United States',
              isReadOnly: true,
              validationType: ValidationType.notRequired,
              onSaved: (value, controller) {
                // final cubit = context.read<AuthCubit>();
                // cubit.onChangeSignUpModel(
                //   cubit.state.signUpModel.copyWith(country: 'United States'),
                // );
              },
            ),
            10.height,
            StateSelector(onChanged: (value) {}),
            10.height,
            CommonTextField(
              prefixIcon: _requiredIcon(),
              borderColor: AppColors.disable,
              backgroundColor: AppColors.disable,
              hintText: AppString.city,
              validationType: ValidationType.validateFullName,
              onSaved: (value, controller) {},
            ),
            20.height,
            CommonButton(titleText: 'Update', onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _requiredIcon() =>
      const CommonText(text: '*', textColor: AppColors.warning, fontSize: 20, top: 10);
}
