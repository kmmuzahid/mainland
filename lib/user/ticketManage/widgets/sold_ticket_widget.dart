import 'package:flutter/material.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/user/ticketManage/widgets/ticket_summery_view_widget.dart';

class SoldTicketWidget extends StatefulWidget {
  const SoldTicketWidget({super.key, required this.eventName, required this.summery});
  final String eventName;
  final Map<String, String> summery;

  @override
  State<SoldTicketWidget> createState() => _SoldTicketWidgetState();
}

class _SoldTicketWidgetState extends State<SoldTicketWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Utils.deviceSize.width * .6,
          child: CommonText(
            text: widget.eventName,
            style: AppTextStyles.titleLarge,
            textColor: AppColors.primaryColor,
            textAlign: TextAlign.left,
            alignment: MainAxisAlignment.start,
          ),
        ).start,
        10.height,
        CommonText(text: AppString.ticketDetails, style: AppTextStyles.titleMedium).start,
        10.height,
        TicketSummeryViewWidget(backgroundColor: AppColors.primary50, summery: widget.summery),
      ],
    );
  }
}
