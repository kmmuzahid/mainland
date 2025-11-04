import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/other_widgets/common_dialog.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/venue/venueHome/widgets/venue_app_bar_widget.dart';
import 'package:mainland/venue/venueHome/widgets/venue_validate_dialogue_widget.dart';

class VenueHistoryWidget extends StatelessWidget {
  const VenueHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.height,
        VenueAppBarWidget(title: AppString.history),
        GestureDetector(
          onTap: () {
            commonDialog(
              isDismissible: true,
              child: VenueValidateDialogueWidget(title: AppString.history, onConfim: (value) {}),
              context: context,
            );
          },
          child: CommonText(
            text: AppString.insertNewEventCode,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            textColor: AppColors.primaryColor,
          ),
        ).end,
        20.height,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: AppColors.backgroundWhite,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.greay100, width: 1.5.w),
          ),
          child: Column(
            children: [
              CommonText(
                text: '${AppString.eventCode}: 63254AB1',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                bottom: 10,
              ).start,
              SizedBox(
                width: Utils.deviceSize.width * .6,
                child: CommonText(
                  text: 'Juice WRLD Eko Hotel & Suites Monday, September 6',
                  fontSize: 22,
                  autoResize: false,
                  maxLines: 10,
                  textAlign: TextAlign.left,
                  textColor: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ).start,
              ...{
                'Premium': 10,
                'Standard': 20,
                'VIP': 50,
                'Free': 30,
              }.entries.map((e) => _ticketBuidler(title: e.key, quantity: e.value.toString())),
            ],
          ),
        ),
      ],
    );
  }

  Widget _ticketBuidler({required String title, required String quantity}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white500,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          CommonText(text: title, fontSize: 14, fontWeight: FontWeight.w600),
          const Spacer(),
          SizedBox(
            width: 60.w,
            height: 37.h,
            child: CommonText(
              backgroundColor: AppColors.backgroundWhite,
              text: quantity,
              borderRadious: 8,
              top: 2,
              fontSize: 14,
              alignment: MainAxisAlignment.center,
              fontWeight: FontWeight.w600,
              textColor: AppColors.greay,
            ),
          ),
        ],
      ),
    );
  }
}
