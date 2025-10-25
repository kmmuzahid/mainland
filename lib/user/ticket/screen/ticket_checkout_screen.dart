import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/other_widgets/dual_field_row_widget.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

enum TicketCheckoutType { organizer, attendee }

@RoutePage()
class TicketCheckoutScreen extends StatelessWidget {
  const TicketCheckoutScreen({super.key, required this.type});

  final TicketCheckoutType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              width: Utils.deviceSize.width * .6,
              child: CommonText(
                text: 'Juice WRLD Eko Hotel & Suites Monday, September 6',
                textAlign: TextAlign.left,
                style: AppTextStyles.headlineSmall?.copyWith(color: AppColors.primaryColor),
              ),
            ).start,
            CommonText(
              text: AppString.attendeeInformation,
              style: AppTextStyles.bodyMedium,
              top: 10,
              bottom: 10,
            ).start,
            _Summery({
              'Full Name': 'Gbenga Drebak',
              'Email Address': 'gbenga123@gmail.com',
              'Phone Number': '+011 245 7893',
            }),
            CommonText(text: 'Summary', style: AppTextStyles.bodyMedium, top: 10, bottom: 10).start,
            _Summery({'Premium (x1)': '500', 'Mainland Fee': '2', 'Subtotal': '502'}),
            10.height,
            CommonButton(
              titleText: AppString.checkout,
              onTap: () {
                appRouter.popUntilRouteWithName(EventDetailsRoute.name);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _Summery(Map<String, dynamic> data) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h, bottom: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greay100, width: 1.2.w),
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          ...data.entries.map(
            (e) => DualFieldRow(
              left: CommonText(text: e.key, fontSize: 16, textColor: AppColors.greay500),
              spaceBetween: true,
              right: CommonText(
                text: e.value.toString(),
                fontSize: 16,
                textColor: AppColors.greay500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
