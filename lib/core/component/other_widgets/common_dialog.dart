import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';

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
      child: IntrinsicHeight(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: child,
        ),
      ),
    ),
  );
}
