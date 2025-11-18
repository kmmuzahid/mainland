import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/mainlad/event_title_widget.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_multiline_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

@RoutePage()
class EventNotificationEnableScreen extends StatelessWidget {
  const EventNotificationEnableScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              EventTitleWidget(title: title).start,
              8.height,
              const CommonText(text: 'Notification', fontSize: 16).start,
              const CommonText(
                textAlign: TextAlign.left,
                fontSize: 14,
                autoResize: false,
                maxLines: 3,
                text:
                    'Send one Message per issue. Avoid repeating Messages on the same issue to ensure quick Notification.',
              ).start,
              10.height,
              CommonMultilineTextField(
                height: 270.h,
                hintText: AppString.writeYourMessageHere,
                onSaved: (value, controller) {},
                validationType: ValidationType.validateRequired,
                maxLength: 10,
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonButton(
                    buttonColor: AppColors.white400,
                    titleText: AppString.cancel,
                    onTap: () {
                      appRouter.pop();
                    },
                  ),
                  20.width,
                  CommonButton(
                    titleText: AppString.send,
                    onTap: () {
                      appRouter.pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
