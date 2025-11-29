import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/mainlad/event_title_widget.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/bloc/cubit_scope.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
import 'package:mainland/organizer/ticketMange/cubit/org_live_ticket_cubit.dart';
import 'package:mainland/organizer/ticketMange/cubit/org_live_ticket_state.dart';
import 'package:mainland/organizer/ticketMange/model/org_ticket_summery_model.dart';
import 'package:mainland/user/ticket/model/ticket_picker_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrgLiveTicketWidget extends StatelessWidget {
  const OrgLiveTicketWidget({required this.eventName, required this.id, super.key});
  final String eventName;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EventTitleWidget(title: eventName).start,
        10.height,
        Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppColors.white400,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: CubitScope<OrgLiveTicketCubit, OrgLiveTicketState>(
            create: () => OrgLiveTicketCubit()..fetch(id: id),
            builder: (context, cubit, state) {
              final premiumTicket = getTicket(TicketName.Premium, state);
              final vipTicket = getTicket(TicketName.VIP, state);
              final standardTicket = getTicket(TicketName.Standard, state);
              final otherTicket = getTicket(TicketName.Other, state);

              return Skeletonizer(
                enabled: state.isLoading,
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(1.5),
                    2: FlexColumnWidth(2),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    // Header row
                    TableRow(
                      children: [
                        _buildTableHeader('Ticket Type(s)'),
                        _buildTableHeader('Available'),
                        _buildTableHeader('Sold / Outstanding'),
                      ],
                    ),
                    // Premium ticket row
                    _buildTableRow(TicketName.Premium.displayName, premiumTicket,
                    ),
                    // VIP ticket row
                    _buildTableRow(TicketName.VIP.displayName.toUpperCase(), vipTicket),
                    // Standard ticket row
                    _buildTableRow(TicketName.Standard.displayName, standardTicket),
                    // Other ticket row
                    _buildTableRow(TicketName.Other.displayName, otherTicket),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  int calculateSold(OrgTicketSummeryModel? model) {
    if (model == null) return 0;
    final available = model.availableUnits ?? 0;
    final outStanding = model.outstandingUnits ?? 0;
    if (outStanding == 0) return 0;
    return outStanding - available;
  }

  OrgTicketSummeryModel? getTicket(TicketName ticketType, OrgLiveTicketState state) {
    final index = state.data.indexWhere(
      (e) => e.type?.toLowerCase() == ticketType.name.toLowerCase(),
    );
    if (index == -1) return null;
    return state.data[index];
  }

  Widget _buildTableHeader(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
      child: CommonText(
        text: text,
        fontSize: 16,
        textColor: AppColors.greay300,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  TableRow _buildTableRow(String label, OrgTicketSummeryModel? ticket) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
          child: CommonText(text: label, fontSize: 16),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
          child: Container(
            height: 35.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.backgroundWhite,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: CommonText(text: '${ticket?.availableUnits ?? 0}', fontSize: 16),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
          child: Container(
            height: 35.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.backgroundWhite,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: CommonText(
              text: '${calculateSold(ticket)}/${ticket?.outstandingUnits ?? 0}',
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
