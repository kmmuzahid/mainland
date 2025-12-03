import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/common/tickets/widgets/ticket_filter_widget.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/mainlad/event_title_widget.dart';
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
    required this.summery,
    required this.ticketFilter, 
  }); 
  final Map<String, String> summery;
  final TicketFilter ticketFilter; 

  @override
  Widget build(BuildContext context) {
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
        TicketSummeryViewWidget(
          backgroundColor: ticketFilter == TicketFilter.Expired
              ? AppColors.greay50
              : AppColors.primary50,
          summery: summery,
        ),
        20.height,
        
      ],
    );
  }
}
