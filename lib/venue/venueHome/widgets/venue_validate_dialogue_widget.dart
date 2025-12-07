import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/custom_form.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/utils/log/app_log.dart';

class VenueValidateDialogueWidget extends StatelessWidget {
  const VenueValidateDialogueWidget({super.key, required this.title, required this.onConfim});
  final String title;
  final Function(String code) onConfim;

  @override
  Widget build(BuildContext context) {
    return _content();
  }

  CustomForm _content() {
    return CustomForm(
      builder: (context, formKey) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            33.height,
            CommonText(
              text: title,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              textColor: AppColors.primaryColor,
            ).center,
            16.height,
            SizedBox(
              width: 228.w,
              child: CommonTextField(
                backgroundColor: AppColors.greay50,
                hintText: AppString.insertNewEventCode,
                validationType: ValidationType.validateRequired,
                onSaved: (value, controller) {
                  if (value.isNotEmpty) {
                    onConfim(value);
                    appRouter.pop();
                  }
                },
              ),
            ),
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonButton(
                  titleText: AppString.confim,
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      formKey.currentState?.save();
                    }
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
            33.height,
          ],
        );
      },
    );
  }
}
