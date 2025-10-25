import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/tickets/widgets/ticket_filter_widget.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({
    required this.image,
    this.title = 'Juice WRLD Mon. Jan. 12, 8pm Eko Hotel & Suites Pre Order available Nov. 1',
    required this.onTap,
    this.filter,
    super.key,
  });
  final String image;
  final String title;
  final Function() onTap;
  final TicketFilter? filter;

  @override
  Widget build(BuildContext context) {
    return _content();
  }

  GestureDetector _content() {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: CommonImage(
                    enableGrayscale: filter == TicketFilter.Closed || filter == TicketFilter.Used,
                    imageSrc: image,
                    borderRadius: 12,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryText.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                Align(
                  child: CommonText(
                    left: 10,
                    right: 10,
                    text: title,
                    fontSize: 18,
                    textAlign: TextAlign.left,
                    style: AppTextStyles.titleMedium?.copyWith(color: AppColors.textWhite),
                  ),
                ),
                if (filter == TicketFilter.Live ||
                    filter == TicketFilter.Upcoming ||
                    filter == TicketFilter.Used)
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 12.w,
                      height: 12.w,
                      margin: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: filter == TicketFilter.Used
                            ? AppColors.error
                            : AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ) 
             
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              appRouter.push(
                EventDetailsRoute(
                  eventId: '',
                  showEventActions: false,
                  isEventAvailable:
                      filter != TicketFilter.Closed &&
                      filter != TicketFilter.UnderReview &&
                      filter != TicketFilter.Draft &&
                      filter != TicketFilter.Expired,
                  isEventUnderReview: filter == TicketFilter.UnderReview,
                ),
              );
            },
            child: CommonText(
              text: AppString.viewPlus,
              fontSize: 18,
              style: AppTextStyles.titleLarge?.copyWith(color: AppColors.primaryColor),
            ),
          ).start,
        ],
      ),
    );
  }
}
