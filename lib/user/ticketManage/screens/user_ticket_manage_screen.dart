import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/common/tickets/widgets/ticket_filter_widget.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/mainlad/event_title_widget.dart';
import 'package:mainland/core/component/other_widgets/common_dialog.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/bloc/cubit_scope.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/user/ticketManage/cubit/user_ticket_manage_state.dart';
import 'package:mainland/user/ticketManage/widgets/live_and_expired_ticket_widget.dart';
import 'package:mainland/user/ticketManage/widgets/sell_available_ticket_widget.dart';
import 'package:mainland/user/ticketManage/widgets/sold_ticket_widget.dart';

import '../cubit/user_ticket_manage_cubit.dart';
import '../model/ticket_history_details_model.dart';

@RoutePage()
class UserTicketManageScreen extends StatelessWidget {
  const UserTicketManageScreen({
    required this.ticketFilter,
    required this.eventName,
    required this.ticketId,
    super.key,
  });
  final TicketFilter ticketFilter;
  final String ticketId;
  final String eventName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: CubitScope(
          create: () => UserTicketManageCubit()..fetch(eventId: ticketId, filter: ticketFilter),
          builder: (context, cubit, state) => SingleChildScrollView(
            child: RefreshIndicator(
              onRefresh: () {
                return cubit.fetch(eventId: ticketId, filter: ticketFilter);
              },
              child: Column(
                children: [
                  EventTitleWidget(title: eventName).start,
                  getContent(cubit: cubit, state: state, context: context),
                  50.height,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _formatTicketDetails(List<TicketTypeCount> details) {
    return details.map((detail) => '${detail.ticketType} - ${detail.count}x').join('\n');
  }

  Widget getContent({
    required BuildContext context,
    required UserTicketManageCubit cubit,
    required UserTicketManageState state,
  }) {
    if (ticketFilter == TicketFilter.Available) {
      return SellAvailableTicketWidget(
        key: Key('SellAvailableTicketWidget_${state.ticketDetails.hashCode}'),
        tickets: state.ticketDetails,
        cubit: cubit,
      );
    }
    if (ticketFilter == TicketFilter.Sold || ticketFilter == TicketFilter.Expired) {
      final model = state.ticketHistoryDetailsModel; 
      return SoldTicketWidget(
        ticketFilter: ticketFilter,
        soldTicketDetails: model?.details ?? [],
        eventName: model?.eventName ?? '',
        summery: {
          'Types': _formatTicketDetails(model?.summary.types ?? []),
          'Total Sold Price': '\$${model?.summary.totalSellAmount ?? 0}',
          'Total Mainland Commission': '\$${model?.summary.totalMainlandFee ?? 0}',
          'Your Payout':
              '\$${(model?.summary.totalSellAmount ?? 0) - (model?.summary.totalMainlandFee ?? 0)}',
        },
      );
    }
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            if (ticketFilter == TicketFilter.Live)
              Container(
                width: 12.w,
                height: 12.w,
                margin: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
          ],
        ),
        10.height,
        CommonText(text: AppString.ticketDetails, style: AppTextStyles.titleMedium).start,
        10.height,
        ...List.generate(state.ticketDetails.length, (e) {
          final ticket = state.ticketDetails[e];
          return LiveAndExpiredTicketWidget(
            summery: {
              'Type': ticket.ticketType.name,
              'Unit': ticket.unit.toString(),
              'Set Price': '\$${ticket.sellPrice}',
            },
            ticketFilter: ticketFilter,
          );
        }),

        20.height,
        if (ticketFilter == TicketFilter.Live)
          CommonButton(
            titleText: AppString.withdrawTicket,
            isLoading: state.isSaving,
            onTap: () {
              commonDialog(
                isDismissible: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    28.height,
                    CommonText(
                      text: AppString.confirmWithdraw,
                      textColor: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                    CommonText(
                      fontWeight: FontWeight.w400,
                      top: 25,
                      bottom: 25,
                      fontSize: 18,
                      text: AppString.withdrawnTicketsMustBeRelistedToSellAgain,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonButton(
                          buttonRadius: 12,
                          titleText: AppString.confirm,
                          onTap: () {
                            cubit.withdrewTickets();
                            appRouter.pop();
                          },
                        ),
                        24.width,
                        CommonButton(
                          buttonRadius: 12,
                          buttonColor: AppColors.disable,
                          titleText: AppString.cancel,
                          onTap: appRouter.pop,
                        ),
                      ],
                    ),
                    28.height,
                  ],
                ),
                context: context,
              );
            },
          ),
      ],
    );
  }
}
