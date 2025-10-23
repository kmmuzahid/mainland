import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

Future commonDialog({
  required Widget child,
  required BuildContext context,
  bool isDismissible = false,
}) {
  return showDialog(
    context: context,
    barrierDismissible: isDismissible,
    builder: (dialogContext) => Dialog(
      backgroundColor: AppColors.serfeceBG,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: child,
      ),
    ),
  );
}

Future CommonDialogWithActions({
  required List<Widget> content,
  required BuildContext context,
  required String title,
  String? subTitle,
  bool isDismissible = true,
  required Function() onConfirm,
  Function()? onCancel,
}) {
  return showDialog(
    context: context,
    barrierDismissible: isDismissible,
    builder: (dialogContext) => Dialog(
      backgroundColor: AppColors.serfeceBG,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              top: 20,
              text: title,
              fontWeight: FontWeight.w600,
              textColor: AppColors.primaryColor,
              fontSize: 24,
            ),
            if (subTitle != null)
              CommonText(fontWeight: FontWeight.w400, bottom: 10, fontSize: 18, text: subTitle),
            ...content,
            20.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonButton(
                  titleText: AppString.confim,
                  onTap: () {
                    onConfirm.call();
                    appRouter.pop();
                  },
                ),
                20.width,
                CommonButton(
                  buttonColor: AppColors.white400,
                  titleText: AppString.cancel,
                  onTap: () {
                    onCancel?.call();
                    appRouter.pop();
                  },
                ),
              ],
            ),
            20.height,
          ],
        ),
      ),
    ),
  );
}
