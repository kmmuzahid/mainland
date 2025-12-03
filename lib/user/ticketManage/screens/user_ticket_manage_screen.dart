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
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/user/ticketManage/cubit/user_ticket_manage_state.dart';
import 'package:mainland/user/ticketManage/widgets/live_and_expired_ticket_widget.dart';
import 'package:mainland/user/ticketManage/widgets/sell_available_ticket_widget.dart';
import 'package:mainland/user/ticketManage/widgets/sold_ticket_widget.dart';

import '../cubit/user_ticket_manage_cubit.dart';
import '../model/sold_ticket_details_model.dart';

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
    return Column(
      children: [
        ...List.generate(state.ticketDetails.length, (e) {
          final ticket = state.ticketDetails[e];
          return LiveAndExpiredTicketWidget(
            summery: {
              'Type': ticket.ticketType.name,
              'Unit': ticket.totalPurchaseTicket.toString(),
              'Set Price': '\$${ticket.totalPurchaseAmount}',
            },
            ticketFilter: ticketFilter,
          );
        }),
        if (ticketFilter == TicketFilter.Live)
          CommonButton(
            titleText: AppString.withdrawTicket,
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
