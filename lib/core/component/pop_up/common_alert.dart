import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class CommonAlert {
  CommonAlert({
    required this.title,
    required this.onTap,
    this.content,
    this.disableActionButton = false,
    this.disableCancelButton = false,
    this.actionButtonTittle,
    this.cancelButtonTittle,
  }) {
    _alertBuilder();
  }
  final String title;
  String? actionButtonTittle;
  String? cancelButtonTittle;
  final Function onTap;
  final Widget? content;
  final bool disableActionButton;
  final bool disableCancelButton;
  Future<dynamic> _alertBuilder() {
    return showDialog(
      context: navigatorRouterKey.currentContext!,
      builder: (c) => AlertDialog(
        title: Text(title, style: getTheme.textTheme.titleMedium),
        actionsAlignment: MainAxisAlignment.center,
        content: content,
        actions: [
          if (disableCancelButton == false)
            CommonButton(
              titleText: cancelButtonTittle ?? AppString.no,
              buttonWidth: 70,
              buttonHeight: 35,
              buttonColor: AppColors.primaryColor3,
              titleColor: AppColors.textWhite,
              onTap: appRouter.pop,
            ),
          if (disableActionButton == false)
            IntrinsicWidth(
              child: CommonButton(
                titleText: actionButtonTittle ?? AppString.yes,
                buttonHeight: 35,
                buttonColor: AppColors.success,
                titleColor: AppColors.textWhite,
                onTap: () {
                  appRouter.pop();
                  onTap();
                },
              ),
            ),
        ],
      ),
    );
  }
}
