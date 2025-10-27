import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/common/tickets/widgets/ticket_filter_widget.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/organizer/ticketMange/widgets/org_draft_ticket_widget.dart';
import 'package:mainland/organizer/ticketMange/widgets/org_live_ticket_widget.dart';

@RoutePage()
class OrgTicketManageScreen extends StatelessWidget {
  const OrgTicketManageScreen({super.key, required this.ticketFilter, required this.ticketId});
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
    if (ticketFilter == TicketFilter.Live) {
      return const OrgLiveTicketWidget(
        eventName: 'Juice WRLD Eko Hotel & Suites Monday, September 6',
      );
    }
    if (ticketFilter == TicketFilter.Draft) {
      return const OrgDraftTicketWidget();
    }
    return const SizedBox();
  }
}
