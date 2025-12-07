import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/event/model/event_details_model.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/other_widgets/common_dialog.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/bloc/cubit_scope_value.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/venue/venueHome/cubit/venue_cubit.dart';

class ValidateDailogue {
  ValidateDailogue({
    required Function onTap,
    required List<Ticket>? tickets,
    required VenueCubit cubit,
  }) {
    final isNotValid = (tickets?.isEmpty == true || tickets == null);
    commonDialog(
      isDismissible: true,
      child: CubitScopeValue(
        cubit: cubit,
        builder: (context, cubit, state) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            33.height,
            CommonText(
              text: isNotValid ? 'Invalid Ticket' : 'Ticket Purchased',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              textColor: isNotValid ? AppColors.error : AppColors.primaryColor,
            ).center,
            if (tickets?.isNotEmpty ?? false) ...[
              10.height,
              ...tickets?.map(
                    (e) => _ticketBuidler(
                      title: e.type!.displayName,
                      quantity: e.availableUnits.toString(),
                    ),
                  ) ??
                  [],
            ],

            20.height,
            if (tickets?.isNotEmpty ?? false)
              CommonButton(
                isLoading: state.isQrChecking,
                titleText: AppString.validate,
                onTap: () {
                  if (tickets?.isNotEmpty ?? false) {
                    onTap.call();
                  }
                },
              ),
            if (isNotValid)
              CommonButton(
                buttonColor: AppColors.white400,
                titleText: AppString.cancel,
                onTap: appRouter.pop,
              ),
            20.height,
          ],
        ),
      ),
      context: appRouter.navigatorKey.currentState!.context,
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
