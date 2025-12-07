import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/widgets/required_icon_widget.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/mainlad/event_title_widget.dart';
import 'package:mainland/core/component/other_widgets/dual_field_row_widget.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/custom_form.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
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
  const TicketPurchaseScreen({
    required this.type,
    required this.id,
    required this.title,
    required this.ticketOwnerType,
    super.key,
    this.filterTicket,
  });
  final TicketOwnerType type;
  final TicketName? filterTicket;
  final TicketOwnerType ticketOwnerType;
  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      backgroundColor: AppColors.background,
      body: BlocProvider(
        create: (context) =>
            TicketPurchaseCubit(eventId: id)
              ..fetchTicketPurchase(ticketType: filterTicket, ticketOwnerType: ticketOwnerType),
        child: CustomForm(
          builder: (context, formKey) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<TicketPurchaseCubit, TicketPurchaseState>(
              builder: (context, state) {
                final cubit = context.read<TicketPurchaseCubit>();
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      EventTitleWidget(title: title).start,
                      CommonText(
                        text: AppString.attendeeInformation,
                        style: AppTextStyles.bodyMedium,
                        top: 10,
                        bottom: 10,
                      ).start,
                      CommonTextField(
                        onChanged: (value) {
                          cubit.onChangeState(state.copyWith(userName: value));
                        },
                        prefixIcon: const RequiredIconWidget(),
                        backgroundColor: AppColors.backgroundWhite,
                        hintText: AppString.fullName,
                        validationType: ValidationType.validateFullName,
                      ),
                      10.height,
                      CommonTextField(
                        onChanged: (value) {
                          cubit.onChangeState(state.copyWith(email: value));
                        },
                        prefixIcon: const RequiredIconWidget(),
                        hintText: AppString.emailAddress,
                        backgroundColor: AppColors.backgroundWhite,
                        validationType: ValidationType.validateEmail,
                      ),
                      10.height,
                      CommonTextField(
                        onChanged: (value) {
                          cubit.onChangeState(state.copyWith(phoneNumber: value));
                        },
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
                      if (state.isLoading)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            child: CircularProgressIndicator(),
                          ),
                        ),
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
                                context.read<TicketPurchaseCubit>().onTicketSelection(
                                  state.tickets[index].copyWith(count: count),
                                );
                              },
                              userName: state.tickets[index].userName,
                              title: state.tickets[index].type,
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
                      _summery(
                        title: '${AppString.mainlandFee} (${state.percentage}%)',
                        price: state.mainlandFee,
                      ),
                      if (ticketOwnerType == TicketOwnerType.organizer)
                        _summery(
                          title: '${AppString.discount} (${state.promoPercentage}%)',
                          price: state.discount,
                        ),
                      _summery(title: AppString.total, price: state.total, isBold: true),
                      Divider(color: AppColors.greay50, thickness: 2),
                      10.height,
                      if (filterTicket == null) ...[
                        CommonText(text: AppString.discount, style: AppTextStyles.label).start,
                        CustomForm(
                          builder: (context, formKey) => Padding(
                            padding: EdgeInsets.only(top: 5.h, bottom: 20.h),
                            child: CommonTextField(
                              hintText: AppString.promoCode,
                              validationType: ValidationType.notRequired,
                              backgroundColor: AppColors.backgroundWhite,
                              onChanged: (value) {
                                cubit.onChangeState(state.copyWith(promoCode: value));
                              },
                              suffixIcon: CommonButton(
                                onTap: () {
                                  formKey.currentState?.save();
                                  cubit.fetchPromo();
                                },
                                titleText: AppString.apply,
                                buttonColor: AppColors.transparent,
                                titleColor: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],

                      CommonButton(
                        titleText: AppString.next,
                        onTap: () {
                          formKey.currentState?.save();
                          if (formKey.currentState?.validate() ?? false) {
                            appRouter.push(
                              TicketCheckoutRoute(
                                type: TicketOwnerType.organizer,
                                cubit: cubit,
                                title: title,
                                ticketOwnerType: ticketOwnerType,
                              ),
                            );
                          }
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
        final item = filteredList[index];
        final title =
            '${item.type} (x${item.count}) ${item.userName != null ? '- ${item.userName}' : ''}';
        return _summery(title: title, price: item.price * item.count);
      },
    );
  }

  Widget _summery({required String title, required double price, bool isBold = false}) {
    final style = AppTextStyles.bodyMedium?.copyWith(
      fontWeight: isBold ? FontWeight.bold : AppTextStyles.bodyMedium?.fontWeight,
    );
    return Row(
      children: [
        CommonText(text: title, style: style),
        const Spacer(),
        CommonText(text: '\$$price', style: style, alignment: MainAxisAlignment.end),
      ],
    );
  }
}
