import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/other_widgets/dual_field_row_widget.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
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
class OrganizerTicketBuyingScreen extends StatelessWidget {
  const OrganizerTicketBuyingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      backgroundColor: AppColors.background,
      body: BlocProvider(
        create: (context) => TicketPurchaseCubit()..fetchTicketPurchase(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocBuilder<TicketPurchaseCubit, TicketPurchaseState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
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
                            title: state.tickets[index].title,
                            price: '${state.tickets[index].price}',
                          ),
                        );
                      },
                    ),
                    Divider(color: AppColors.greay50, thickness: 2),
                    _summeryCalculations(state.tickets),
                    Divider(color: AppColors.greay50, thickness: 2),
                    _summery(title: AppString.subtotal, price: state.subtotal, isBold: true),
                    _summery(title: AppString.mainlandFee, price: state.mainlandFee),
                    _summery(title: AppString.discount, price: state.discount),
                    _summery(title: AppString.total, price: state.total, isBold: true),

                    CommonButton(
                      titleText: AppString.next,
                      onTap: () {
                        appRouter.push(TicketCheckoutRoute(type: TicketCheckoutType.organizer));
                      },
                    ),
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
