import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/mainlad/event_title_widget.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
import 'package:mainland/user/ticket/cubit/ticket_purchase_cubit.dart';
import 'package:mainland/user/ticket/model/available_ticket_model.dart';
import 'package:mainland/user/ticket/model/ticket_picker_model.dart';
import 'package:mainland/user/ticket/screen/ticket_checkout_screen.dart';

import '../cubit/ticket_purchase_state.dart';

@RoutePage()
class AttendieTicketAvailablityScreen extends StatelessWidget {
  const AttendieTicketAvailablityScreen({
    required this.eventId,
    required this.eventName,
    super.key,
  });
  final String eventId;
  final String eventName;

  @override
  Widget build(BuildContext context) {
    // final list = {'Premium': 5, 'Standard': 10, 'VIP': 15, 'Free': 20};
    return BlocProvider(
      create: (context) => TicketPurchaseCubit(eventId: eventId)..fetchAvailableTicketSummery(),
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<TicketPurchaseCubit, TicketPurchaseState>( 
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return Column(
                children: [
                  EventTitleWidget(title: eventName).start,
                  state.availableTickets.isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(top: 100.h),
                          child: CommonText(
                            text: 'No tickets available',
                            style: AppTextStyles.bodyLarge,
                          ),
                        )
                      :
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h, bottom: 12.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greay50),
                      color: AppColors.backgroundWhite,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      children: [
                        CommonText(
                          bottom: 10,
                          text: AppString.availableunits,
                          style: AppTextStyles.bodyLarge,
                        ),
                        ...List.generate(state.availableTickets.length, (index) {
                          final item = state.availableTickets[index];
                          return itemBuilder(item);
                        }),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget itemBuilder(AvailableTicketModel availableTicketModel) {
    return GestureDetector(
      onTap: () {
        appRouter.push(
          TicketPurchaseRoute(
            type: TicketOwnerType.attendee,
            ticketOwnerType: TicketOwnerType.attendee,
            filterTicket: availableTicketModel.ticketType,
            id: eventId,
            title: eventName,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greay50,
          borderRadius: BorderRadius.circular(8.r),
        ),
        margin: EdgeInsets.symmetric(vertical: 3.h),
        padding: EdgeInsets.all(10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 70.w,
              child: CommonText(
                text: availableTicketModel.ticketType.name.capitalizeEachWord(),
                style: AppTextStyles.bodyMedium,
              ),
            ),
            Container( 
              width: 50.w,
              height: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.backgroundWhite,
              ),
              alignment: Alignment.center,
              child: CommonText( 
                text: availableTicketModel.availableUnits.toString(),
                textColor: AppColors.greay, 
                fontWeight: FontWeight.w600,
                fontSize: 14,  
                style: AppTextStyles.bodyMedium,
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: AppColors.primaryColor, size: 20),
          ],
        ),
      ),
    );
  }
}
