import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/mainlad/event_title_widget.dart';
import 'package:mainland/core/component/other_widgets/common_dialog.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/venue/venueHome/cubit/venue_cubit.dart';
import 'package:mainland/venue/venueHome/widgets/venue_app_bar_widget.dart';
import 'package:mainland/venue/venueHome/widgets/venue_validate_dialogue_widget.dart';

class VenueHistoryWidget extends StatelessWidget {
  const VenueHistoryWidget({required this.cubit, required this.state, super.key});
  final VenueCubit cubit;
  final VenueState state;

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
              child: VenueValidateDialogueWidget(
                title: AppString.history,
                onConfim: cubit.fetchHistory,
              ),
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
        state.isHistoryLoading
            ? Center(
                child: CircularProgressIndicator(padding: EdgeInsets.only(top: 80.h)),
              )
            : state.venueHistoryModel == null
            ? const SizedBox.shrink()
            : Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: AppColors.backgroundWhite,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.greay100, width: 1.5.w),
          ),
          child: Column(
            children: [
              CommonText(
                      text: '${AppString.eventCode}: ${state.venueHistoryModel?.eventCode ?? ''}',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                bottom: 10,
              ).start,
                    EventTitleWidget(title: state.venueHistoryModel?.eventName ?? '').start,
                    ...state.venueHistoryModel?.used.map(
                          (e) => _ticketBuidler(title: e.type, quantity: e.count.toString()),
                        ) ??
                        [],
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
          Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundWhite,
              borderRadius: BorderRadius.circular(10.r),
            ),
            alignment: Alignment.center,
            width: 60.w,
            height: 37.h,
            child: CommonText(
              text: quantity,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              textColor: AppColors.greay,
            ),
          ),
        ],
      ),
    );
  }
}
