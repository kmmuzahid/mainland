import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/other_widgets/dual_field_row_widget.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';

class TicketSummeryViewWidget extends StatelessWidget {
  const TicketSummeryViewWidget({
    super.key,
    required this.summery,
    this.borderColor,
    this.backgroundColor,
    this.rightFiled,
  });
  final Map<String, dynamic> summery;
  final Color? backgroundColor;
  final Widget? rightFiled;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primary50,
        border: Border.all(color: borderColor ?? AppColors.primary100, width: 1.4.w),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(summery.length, (index) {
          return Container(
            padding: EdgeInsets.only(top: 5.h, bottom: 1.h),
            decoration: BoxDecoration(
              border: Border(
                bottom: (summery.length - 1) != index
                    ? BorderSide(color: Colors.grey.shade300)
                    : BorderSide.none,
              ),
            ),
            child: DualFieldRow(
              spaceBetween: summery.values.elementAt(index) is Widget,
              space: 20,
              left: CommonText(
                textColor: AppColors.greay400,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                textAlign: TextAlign.left,
                text: summery.keys.elementAt(index),
              ),
              right: summery.values.elementAt(index) is Widget
                  ? summery.values.elementAt(index)
                  : CommonText(
                      textColor: AppColors.greay400,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      textAlign: TextAlign.left,
                      maxLines: index == 0 ? 5 : 1,
                      text: summery.values.elementAt(index).toString(),
                      alignment: MainAxisAlignment.end,
                    ),
            ),
          );
        }),
      ),
    );
  }
}
