import 'package:flutter/material.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';

class EventTitleWidget extends StatelessWidget {
  const EventTitleWidget({super.key, required this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Utils.deviceSize.width * .7,
      child: CommonText(
        text: title ?? 'Juice WRLD Eko Hotel & Suites Monday, November 04',
        autoResize: false,
        maxLines: 12,
        textAlign: TextAlign.left,
        textColor: AppColors.primaryColor,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
