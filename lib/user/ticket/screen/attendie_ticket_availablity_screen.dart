import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
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
import 'package:mainland/user/ticket/cubit/ticket_purchase_cubit.dart';
import 'package:mainland/user/ticket/model/available_ticket_model.dart';
import 'package:mainland/user/ticket/model/ticket_picker_model.dart';
import 'package:mainland/user/ticket/screen/ticket_checkout_screen.dart';

import '../cubit/ticket_purchase_state.dart';

@RoutePage()
class AttendieTicketAvailablityScreen extends StatelessWidget {
  const AttendieTicketAvailablityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final list = {'Premium': 5, 'Standard': 10, 'VIP': 15, 'Free': 20};
    return BlocProvider(
      create: (context) => TicketPurchaseCubit()..fetchAvailableTicket(),
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocSelector<TicketPurchaseCubit, TicketPurchaseState, List<AvailableTicketModel>>(
            selector: (state) => state.availableTickets,
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(
                    width: Utils.deviceSize.width * .6,
                    child: CommonText(
                      text: 'Juice WRLD Eko Hotel & Suites Monday, September 6',
                      textAlign: TextAlign.left,
                      style: AppTextStyles.headlineSmall?.copyWith(color: AppColors.primaryColor),
                    ),
                  ).start,
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
                        ...List.generate(state.length, (index) {
                          final item = state[index];
                          return itemBuilder(item.ticketType, item.availableUnits.toString());
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

  Widget itemBuilder(TicketType ticketType, String value) {
    return GestureDetector(
      onTap: () {
        appRouter.push(
          TicketPurchaseRoute(type: TicketOwnerType.attendee, filterTicket: ticketType),
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
                text: ticketType.name.capitalizeEachWord(),
                style: AppTextStyles.bodyMedium,
              ),
            ),
            SizedBox(
              width: 50.w,
              height: 40.w,
              child: CommonText(
                text: value,
                textColor: AppColors.greay,
                borderColor: AppColors.backgroundWhite,
                borderRadious: 8,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                alignment: MainAxisAlignment.center,
                top: 2,
                style: AppTextStyles.bodyMedium,
                backgroundColor: AppColors.backgroundWhite,
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: AppColors.primaryColor, size: 20),
          ],
        ),
      ),
    );
  }
}
