import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/utils/log/app_log.dart';

class TicketPicker extends StatefulWidget {
  const TicketPicker({
    super.key,
    required this.limit,
    required this.onChange,
    required this.title,
    required this.price,
    this.userName,
  });
  final int limit;
  final String title;
  final String? userName;
  final String price;
  final Function(int)? onChange;

  @override
  State<TicketPicker> createState() => _TicketPickerState();
}

class _TicketPickerState extends State<TicketPicker> {
  int count = 0;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '0');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.userName != null)
          CommonText(
            text: widget.userName ?? '',
            style: AppTextStyles.bodyMedium,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ).start,
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: '${widget.title} (${widget.limit})',
                  style: AppTextStyles.bodyMedium,
                ),
                CommonText(
                  text: '\$${widget.price}',
                  style: AppTextStyles.bodyMedium?.copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
            const Spacer(),
            CommonButton(
              titleText: '',
              buttonWidth: 40,
              buttonColor: count > 0 ? AppColors.primaryColor : AppColors.greay50,
              icon: const Icon(Icons.remove),
              onTap: () {
                setState(() {
                  if (count > 0) {
                    count--;
                    controller.text = count.toString();
                    widget.onChange?.call(count);
                  }
                });
              },
            ),
            5.width,
            SizedBox(
              width: 55,
              height: 40,
              child: CommonTextField(
                paddingHorizontal: 0,
                paddingVertical: 0,
                validationType: ValidationType.validateNumber,
                controller: controller,
              ),
            ),
            5.width,
            CommonButton(
              titleText: '',
              buttonWidth: 40,
              buttonColor: count < widget.limit ? AppColors.primaryColor : AppColors.greay50,
              icon: const Icon(Icons.add),
              onTap: () {
                setState(() {
                  if (count < widget.limit) {
                    count++;
                    controller.text = count.toString();
                    widget.onChange?.call(count);
                  }
                });
              },
            ),
          ],
        ),
        Divider(color: AppColors.greay50, thickness: 2),
      ]
    );
  }
}
