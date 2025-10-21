import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/tickets/widgets/ticket_filter_widget.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/user/ticketManage/widgets/live_and_expired_ticket_widget.dart';
import 'package:mainland/user/ticketManage/widgets/sell_available_ticket_widget.dart';
import 'package:mainland/user/ticketManage/widgets/sold_ticket_widget.dart';

import '../model/sold_ticket_details_model.dart';

@RoutePage()
class UserTicketManageScreen extends StatelessWidget {
  const UserTicketManageScreen({required this.ticketFilter, required this.ticketId, super.key});
  final TicketFilter ticketFilter;
  final String ticketId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: getContent(),
      ),
    );
  }

  Widget getContent() {
    if (ticketFilter == TicketFilter.Available) {
      return SellAvailableTicketWidget(
        eventName: 'Juice WRLD Eko Hotel & Suites Monday, September 6',
        type: 'Standard',
        unit: 10,
        price: 120,
        onSell: (unit, price) {},
      );
    }
    if (ticketFilter == TicketFilter.Sold) {
      return SoldTicketWidget(
        soldTicketDetails: [
          SoldTicketDetailsModel(
            type: 'Standard',
            unit: 10,
            soldPrice: 120,
            mainlandCommission: 12,
            yourPayout: 108,
          ),
          SoldTicketDetailsModel(
            type: 'VIP',
            unit: 7,
            soldPrice: 150,
            mainlandCommission: 15,
            yourPayout: 135,
          ),
          SoldTicketDetailsModel(
            type: 'Premium',
            unit: 8,
            soldPrice: 150,
            mainlandCommission: 15,
            yourPayout: 135,
          ),
        ],
        eventName: 'Juice WRLD Eko Hotel & Suites Monday, September 6',
        summery: const {
          'Types': 'Standard - 1x\nVIP -  2x',
          'Total Sold Price': '\$520',
          'Mainland Commission (10%)': '\$52',
          'Your Payout': '\$468',
        },
      );
    }
    return LiveAndExpiredTicketWidget(
      eventName: 'Juice WRLD Eko Hotel & Suites Monday, September 6',
      summery: {'Type': 'Standard', 'Unit': '02', 'Set Price': '\$120'},
      ticketFilter: ticketFilter,
      onWithdrew: () {},
    );
  }
}
