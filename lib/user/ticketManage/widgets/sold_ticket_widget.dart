import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/user/ticketManage/widgets/ticket_summery_view_widget.dart';

import '../model/sold_ticket_details_model.dart';

class SoldTicketWidget extends StatefulWidget {
  const SoldTicketWidget({
    super.key,
    required this.eventName,
    required this.summery,
    required this.soldTicketDetails,
  });
  final String eventName;
  final Map<String, String> summery;
  final List<SoldTicketDetailsModel> soldTicketDetails;

  @override
  State<SoldTicketWidget> createState() => _SoldTicketWidgetState();
}

class _SoldTicketWidgetState extends State<SoldTicketWidget> {
  bool viewDetails = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          AnimatedCrossFade(
            firstChild: _buildViewDetails(),
            secondChild: _tickets(),
            crossFadeState: viewDetails ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(top: 8, text: '*', textColor: AppColors.error, fontSize: 18),
              Expanded(
                child: CommonText(
                  textAlign: TextAlign.left,
                  text: AppString
                      .whenYouWithdrawYourPayoutFromWalletPayoutsAreSentToYourLinkedAccount14DaysAfterTheEvent,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  top: 10,
                  bottom: 10,
                ),
              ),
            ],
          ),
          CommonButton(
            icon: Icon(viewDetails ? Icons.add : Icons.remove, color: AppColors.iconColorBlack),
            titleText: viewDetails ? AppString.viewDetails : AppString.viewLess,
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

  Widget _tickets() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.soldTicketDetails.length,
      itemBuilder: (context, index) {
        final ticket = widget.soldTicketDetails[index];
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
            backgroundColor: AppColors.primary50,
            summery: {
              'Type': ticket.type,
              'Unit': ticket.unit.toString(),
              'Set Price': ticket.soldPrice.toString(),
              'Mainland Commission': ticket.mainlandCommission.toString(),
              'Your Payout': ticket.yourPayout.toString(),
            },
          ),
        );
      },
    );
  }

  Widget _buildViewDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonText(text: AppString.ticketDetails, style: AppTextStyles.titleMedium).start,
        10.height,
        TicketSummeryViewWidget(backgroundColor: AppColors.primary50, summery: widget.summery),
      ],
    );
  }
}
