import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/mainlad/event_title_widget.dart';
import 'package:mainland/core/component/other_widgets/dual_field_row_widget.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/bloc/cubit_scope_value.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/user/ticket/cubit/ticket_purchase_cubit.dart';
import 'package:mainland/user/ticket/cubit/ticket_purchase_state.dart';
import 'package:mainland/user/ticket/model/ticket_picker_model.dart';

@RoutePage()
class TicketCheckoutScreen extends StatelessWidget {
  const TicketCheckoutScreen({
    required this.type,
    required this.cubit,
    required this.title,
    required this.ticketOwnerType,
    super.key,
  });

  final TicketOwnerType type;
  final TicketPurchaseCubit cubit;
  final String title;
  final TicketOwnerType ticketOwnerType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: CubitScopeValue(
          cubit: cubit,
          builder: (context, cubit, state) => SingleChildScrollView(
            child: Column(
              children: [
                EventTitleWidget(title: title).start,
                CommonText(
                  text: AppString.attendeeInformation,
                  style: AppTextStyles.bodyMedium,
                  top: 10,
                  bottom: 10,
                ).start,
                _Summery({
                  'Full Name': state.userName,
                  'Email Address': state.email,
                  'Phone Number': state.phoneNumber,
                }),
                CommonText(
                  text: 'Summary',
                  style: AppTextStyles.bodyMedium,
                  top: 10,
                  bottom: 10,
                ).start,
                _buildSummery(state),
                20.height,
                CommonButton(
                  titleText: AppString.checkout,
                  onTap: () {
                    cubit.checkout(ticketOwnerType);
                  },
                ),
                50.height,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSummery(TicketPurchaseState state) {
    final data = state.tickets.map(
      (e) => MapEntry('${e.type} (x${e.count})', '\$${e.price * e.count}'),
    );

    final Map<String, dynamic> value = Map<String, dynamic>.fromEntries(data);
    value.addAll({
      'Subtotal': '\$${state.subtotal}',
      'Mainland Fee': '\$${state.mainlandFee}',
      if (ticketOwnerType == TicketOwnerType.organizer)
        '${AppString.discount} (${state.promoPercentage}%)': '\$${state.discount}',
      'Total': '\$${state.total}',
    });

    return _Summery(value);
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
