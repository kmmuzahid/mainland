import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/common/tickets/widgets/ticket_filter_widget.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/other_widgets/common_dialog.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/user/ticketManage/widgets/ticket_summery_view_widget.dart';

class LiveAndExpiredTicketWidget extends StatelessWidget {
  const LiveAndExpiredTicketWidget({
    super.key,
    required this.eventName,
    required this.summery,
    required this.ticketFilter,
    required this.onWithdrew,
  });
  final String eventName;
  final Map<String, String> summery;
  final TicketFilter ticketFilter;
  final void Function() onWithdrew;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Utils.deviceSize.width * .6,
              child: CommonText(
                text: eventName,
                style: AppTextStyles.titleLarge,
                textColor: AppColors.primaryColor,
                textAlign: TextAlign.left,
                alignment: MainAxisAlignment.start,
              ),
            ),
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
        TicketSummeryViewWidget(
          backgroundColor: ticketFilter == TicketFilter.Expired
              ? AppColors.greay50
              : AppColors.primary50,
          summery: summery,
        ),
        20.height,
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
                            onWithdrew();
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
