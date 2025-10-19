import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/widgets/required_icon_widget.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/other_widgets/dual_field_row_widget.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/user/ticket/cubit/ticket_purchase_state.dart';
import 'package:mainland/user/ticket/model/ticket_picker_model.dart';
import 'package:mainland/user/ticket/screen/ticket_checkout_screen.dart';
import 'package:mainland/user/ticket/widgets/ticket_picker.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';

import '../cubit/ticket_purchase_cubit.dart';

@RoutePage()
class TicketPurchaseScreen extends StatelessWidget {
  const TicketPurchaseScreen({super.key, required this.type, this.filterTicket});
  final TicketCheckoutType type;
  final String? filterTicket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      backgroundColor: AppColors.background,
      body: BlocProvider(
        create: (context) =>
            TicketPurchaseCubit()..fetchTicketPurchase(filterTicketType: filterTicket),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocBuilder<TicketPurchaseCubit, TicketPurchaseState>(
            builder: (context, state) {
              return SingleChildScrollView(
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
                    CommonTextField(
                      prefixIcon: const RequiredIconWidget(),
                      backgroundColor: AppColors.backgroundWhite,
                      hintText: AppString.fullName,
                      validationType: ValidationType.validateFullName,
                    ),
                    10.height,
                    CommonTextField(
                      prefixIcon: const RequiredIconWidget(),
                      hintText: AppString.emailAddress,
                      backgroundColor: AppColors.backgroundWhite,
                      validationType: ValidationType.validateEmail,
                    ),
                    10.height,
                    CommonTextField(
                      prefixIcon: const RequiredIconWidget(),
                      backgroundColor: AppColors.backgroundWhite,

                      hintText: AppString.phoneNumber,
                      validationType: ValidationType.validatePhone,
                    ),
                    10.height,
                    Divider(color: AppColors.greay50, thickness: 2),
                    CommonText(
                      bottom: 5,
                      top: 5,
                      text: AppString.tickets,
                      style: AppTextStyles.bodyMedium,
                    ).start,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.tickets.length,
                      padding: EdgeInsets.zero,

                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: TicketPicker(
                            limit: state.tickets[index].limit,
                            onChange: (count) {
                              context.read<TicketPurchaseCubit>().onTicketSelction(
                                state.tickets[index].copyWith(count: count),
                              );
                            },
                            userName: state.tickets[index].userName,
                            title: state.tickets[index].title,
                            price: '${state.tickets[index].price}',
                          ),
                        );
                      },
                    ),
                    CommonText(
                      bottom: 10,
                      text: AppString.summary,
                      style: AppTextStyles.titleMedium,
                    ).start,
                    _summeryCalculations(state.tickets),
                    Divider(color: AppColors.greay50, thickness: 2),
                    _summery(title: AppString.subtotal, price: state.subtotal, isBold: true),
                    _summery(title: AppString.mainlandFee, price: state.mainlandFee),
                    _summery(title: AppString.discount, price: state.discount),
                    _summery(title: AppString.total, price: state.total, isBold: true),
                    Divider(color: AppColors.greay50, thickness: 2),
                    10.height,
                    if (filterTicket == null) ...[
                      CommonText(text: AppString.discount, style: AppTextStyles.label).start,
                      Padding(
                        padding: EdgeInsets.only(top: 5.h, bottom: 20.h),
                        child: CommonTextField(
                          hintText: AppString.promoCode,
                          validationType: ValidationType.notRequired,
                          backgroundColor: AppColors.backgroundWhite,
                          suffixIcon: CommonButton(
                            titleText: AppString.apply,
                            buttonColor: AppColors.transparent,
                            titleColor: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],

                    CommonButton(
                      titleText: AppString.next,
                      onTap: () {
                        appRouter.push(TicketCheckoutRoute(type: TicketCheckoutType.organizer));
                      },
                    ),
                    50.height,
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _summeryCalculations(List<TicketPickerModel> tickets) {
    final filteredList = tickets.where((element) => element.count > 0).toList();
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        return _summery(
          title: '${filteredList[index].title} (x${filteredList[index].count})',
          price: filteredList[index].price * filteredList[index].count,
        );
      },
    );
  }

  DualFieldRow _summery({required String title, required double price, bool isBold = false}) {
    final style = AppTextStyles.bodyMedium?.copyWith(
      fontWeight: isBold ? FontWeight.bold : AppTextStyles.bodyMedium?.fontWeight,
    );
    return DualFieldRow(
      left: CommonText(text: title, style: style),
      right: CommonText(text: '\$$price', style: style, alignment: MainAxisAlignment.end),
    );
  }
}
