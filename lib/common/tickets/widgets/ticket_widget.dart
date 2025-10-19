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
    this.title = '''Juice WRLD
Mon. Jan. 12, 8pm
Eko Hotel & Suites
Pre Order available
Nov. 1''',
    required this.onTap,
    this.width,
    this.height,
    this.filter,
    super.key,
  });
  final String image;
  final String title;
  final Function() onTap;
  final double? width;
  final double? height;
  final TicketFilter? filter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width?.w ?? double.infinity,
        height: height?.h ?? double.infinity,

        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight.h - 50.w,
                  width: constraints.maxWidth,
                  child: Stack(
                    children: [
                      Positioned.fill(child: CommonImage(imageSrc: image, borderRadius: 12)),
                      Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight.h - 50.w,
                        decoration: BoxDecoration(
                          color: AppColors.primaryText.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      Align(
                        child: CommonText(
                          text: title,
                          style: AppTextStyles.titleMedium?.copyWith(color: AppColors.textWhite),
                        ),
                      ),
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
                    style: AppTextStyles.titleLarge?.copyWith(color: AppColors.primaryColor),
                  ).start,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
