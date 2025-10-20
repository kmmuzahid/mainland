import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/tickets/widgets/ticket_filter_widget.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/user/ticketManage/widgets/live_and_expired_ticket_widget.dart';
import 'package:mainland/user/ticketManage/widgets/sell_available_ticket_widget.dart';
import 'package:mainland/user/ticketManage/widgets/sold_ticket_widget.dart';

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
      return const SoldTicketWidget(
        eventName: 'Juice WRLD Eko Hotel & Suites Monday, September 6',
        summery: {
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
