import 'package:flutter/material.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';

class CreateTicketTitlebar extends StatelessWidget {
  const CreateTicketTitlebar({this.title, this.titleWidget, super.key});
  final String? title;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleWidget != null) titleWidget!,
        if (title != null) CommonText(text: title!, fontSize: 18, fontWeight: FontWeight.w600),
        const Spacer(),
        CommonButton(
          buttonColor: AppColors.background,
          titleColor: AppColors.primaryColor,
          titleText: 'Save Draft',
          onTap: () {},
        ),
      ],
    );
  }
}
