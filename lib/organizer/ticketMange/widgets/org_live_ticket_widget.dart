import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/mainlad/event_title_widget.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

class OrgLiveTicketWidget extends StatelessWidget {
  const OrgLiveTicketWidget({super.key, required this.eventName});
  final String eventName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EventTitleWidget(title: eventName).start,
        Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: AppColors.white400,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 33.h,
                    child: CommonText(
                      text: 'Ticket Type(s)',
                      fontSize: 16,
                      textColor: AppColors.greay300,
                    ),
                  ),
                  SizedBox(
                    height: 33.h,
                    child: CommonText(text: 'Premium', fontSize: 16),
                  ),
                  SizedBox(
                    height: 33.h,
                    child: CommonText(text: 'VIP', fontSize: 16),
                  ),
                  SizedBox(
                    height: 33.h,
                    child: CommonText(text: 'Standard', fontSize: 16),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  CommonText(text: 'Available', fontSize: 16, textColor: AppColors.greay300),
                  _field('100'),
                  _field('70'),
                  _field('100'),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  CommonText(
                    text: 'Sold / Outstanding',
                    fontSize: 16,
                    textColor: AppColors.greay300,
                  ),
                  _field('20/80'),
                  _field('20/80'),
                  _field('0'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _field(String value) {
    return SizedBox(
      width: 95.w,
      height: 35.h,
      child: CommonText(
        text: value,
        fontSize: 16,
        alignment: MainAxisAlignment.center,
        backgroundColor: AppColors.backgroundWhite,
      ),
    );
  }
}
