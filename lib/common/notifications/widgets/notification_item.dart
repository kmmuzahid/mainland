import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/main.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({required this.item, super.key});

  final RemoteMessage item;

  @override
  Widget build(BuildContext context) => _content(context);
  GestureDetector _content(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSnackBar(AppString.noDetailsAvailableForThisNotification, type: SnackBarType.warning);
      },
      child: Card(
        color: getTheme.scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsetsGeometry.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CommonImage(imageSrc: _getImage(), size: 26, imageColor: getTheme.primaryColor),
              10.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: item.notification?.title ?? '',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.greay400,
                    ),
                    CommonText(
                      autoResize: false,
                      text: item.notification?.body ?? '',
                      maxLines: 2,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      textColor: AppColors.greay400,
                    ),
                   
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
