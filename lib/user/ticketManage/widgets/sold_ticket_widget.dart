import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/user/ticketManage/widgets/ticket_summery_view_widget.dart';

import '../model/ticket_history_details_model.dart';

class SoldTicketWidget extends StatefulWidget {
  const SoldTicketWidget({
    required this.eventName,
    required this.summery,
    required this.soldTicketDetails,
    required this.ticketFilter,
    super.key,
  });
  final String eventName;
  final Map<String, String> summery;
  final List<TicketDetail> soldTicketDetails;
  final TicketFilter ticketFilter;

  @override
  State<SoldTicketWidget> createState() => _SoldTicketWidgetState();
}

class _SoldTicketWidgetState extends State<SoldTicketWidget> {
  bool viewDetails = false;

  @override
  Widget build(BuildContext context) {
    final bool isExpired = widget.ticketFilter == TicketFilter.Expired;
    return SingleChildScrollView(
      child: Column(
        children: [
          10.height,
          AnimatedCrossFade(
            firstChild: _buildViewDetails(isExpired),
            secondChild: _tickets(isExpired),
            crossFadeState: isExpired
                ? CrossFadeState.showSecond
                : (viewDetails ? CrossFadeState.showSecond : CrossFadeState.showFirst),
            duration: const Duration(milliseconds: 300),
          ),
          if (!isExpired)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(text: '*', textColor: AppColors.error, fontSize: 18),
                Expanded(
                  child: CommonText(
                    textAlign: TextAlign.left,
                    text: AppString
                        .whenYouWithdrawYourPayoutFromWalletPayoutsAreSentToYourLinkedAccount14DaysAfterTheEvent,
                    fontSize: 14,
                    autoResize: false,
                    maxLines: 10,
                    fontWeight: FontWeight.w300,
                    top: 10,
                    bottom: 10,
                  ),
                ),
              ],
            ),
          10.height,
          if (!isExpired)
          CommonButton(
            icon: Icon(viewDetails ? Icons.remove : Icons.add, color: AppColors.iconColorBlack),
            titleText: viewDetails ? AppString.viewLess : AppString.viewDetails,
            onTap: () {
              setState(() {
                viewDetails = !viewDetails;
              });
            },
          ),
          30.height,
        ],
      ),
    );
  }

  Widget _tickets(bool isExpired) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.soldTicketDetails.length,
      itemBuilder: (context, index) {
        final ticket = widget.soldTicketDetails[index];
        final mainlandFee = ticket.price * (ticket.commission / 100);
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: index == widget.soldTicketDetails.length - 1
                  ? BorderSide.none
                  : BorderSide(width: 1.5.w, color: AppColors.greay100),
            ),
          ),
          child: TicketSummeryViewWidget(
            borderColor: isExpired ? AppColors.greay50 : null,
            backgroundColor: isExpired ? AppColors.greay50 : AppColors.primary50,
            summery: {
              'Type': ticket.ticketType,
              'Unit': ticket.quantity.toString(),
              'Set Price': ticket.price.toString(),
              if (!isExpired)
              'Mainland Commission (${ticket.commission}%)': mainlandFee.toString(),
              if (!isExpired)
              'Your Payout': '${ticket.price - mainlandFee}',
            },
          ),
        );
      },
    );
  }

  Widget _buildViewDetails(bool isExpired) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonText(text: AppString.ticketDetails, style: AppTextStyles.titleMedium).start,
        10.height,
        TicketSummeryViewWidget(
          borderColor: isExpired ? AppColors.greay50 : null,
          backgroundColor: isExpired ? AppColors.greay50 : AppColors.primary50,
          summery: widget.summery,
        ),
      ],
    );
  }
}
