import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/mainlad/event_title_widget.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/custom_form.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/main.dart';
import 'package:mainland/user/ticketManage/cubit/user_ticket_manage_cubit.dart';
import 'package:mainland/user/ticketManage/model/ticket_details_model.dart';
import 'package:mainland/user/ticketManage/widgets/ticket_summery_view_widget.dart';

class SellAvailableTicketWidget extends StatefulWidget {
  const SellAvailableTicketWidget({super.key, required this.tickets, required this.cubit});

  final List<TicketDetailsModel> tickets;
  final UserTicketManageCubit cubit;

  @override
  State<SellAvailableTicketWidget> createState() => _SellAvailableTicketWidgetState();
}

class _SellAvailableTicketWidgetState extends State<SellAvailableTicketWidget> {
  List<TicketDetailsModel> sellInfo = [];
  bool isWantToSell = false;
  bool isAgree = false;
  bool isDisAgree = false;
  late AuthCubit authCubit;

  @override
  void initState() {
    if (sellInfo.isEmpty) {
      sellInfo = widget.tickets
          .map(
            (e) => TicketDetailsModel(
              ticketType: e.ticketType,
              unit: 0, sellPrice: 0,
            ),
          )
          .toList();
    }
    authCubit = context.read();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> upadate() async {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      builder: (contex, formKey) => Column(
        children: [
          10.height,
          CommonText(text: AppString.ticketDetails, style: AppTextStyles.titleMedium).start,
          10.height,

          ...List.generate(widget.tickets.length, _ticketInfoBuilder),

          if (isWantToSell)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  side: BorderSide(
                    width: 2.w,
                    color: isDisAgree ? AppColors.error : AppColors.greay300,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
                  value: isAgree,
                  onChanged: (value) {
                    isDisAgree = false;
                    isAgree = value ?? false;
                    upadate();
                  },
                ),
                CommonText(top: 8, text: '*', textColor: AppColors.error, fontSize: 18),
                Expanded(
                  child: CommonText(
                    textAlign: TextAlign.left,
                    text:
                        AppString.mainlandCharges10CommissionOnAllSaleYourTicketWillBecomeAvailableUnderAttendeeTicketSaleIfSoldItWillBeInvalidatedAndReissuedToTheBuyer(
                          authCubit.state.profileModel?.mainlandFee ?? 0,
                        ),
                    fontSize: 12,
                    autoResize: false,
                    maxLines: 10,
                    fontWeight: FontWeight.w300,
                    top: 10,
                    bottom: 10,
                  ),
                ),
              ],
            ),
          10.height,

          CommonButton(
            isLoading: widget.cubit.state.isSaving,
            titleText: isWantToSell ? AppString.sellNow : AppString.sellTicket,
            onTap: () {
              if (isWantToSell) {
                if (!isAgree) {
                  isDisAgree = true;
                } 
                if (isAgree && formKey.currentState!.validate()) {
                  final List<TicketDetailsModel> sellList = sellInfo
                      .where(
                        (element) =>
                            element.unit > 0 && element.sellPrice > 0,
                      )
                      .toList();
                  if (sellList.isEmpty) {
                    if (mounted)
                      showSnackBar(
                        'Sorry!! Please check price and units',
                        type: SnackBarType.warning,
                      );
                    return;
                  }
                  widget.cubit.sellNow(sellList);
                } else {
                  isAgree = false;
                  upadate();
                  if (mounted)
                    showSnackBar('Please ensure all required field', type: SnackBarType.error);
                }
              }
              isWantToSell = true;
              upadate();
            },
          ),
        ],
      ),
    );
  }

  Widget _ticketInfoBuilder(int index) {
    final ticketModel = widget.tickets[index];
    return Column(
      children: [
        TicketSummeryViewWidget(
          backgroundColor: AppColors.primary50,
          summery: {
            'Type': ticketModel.ticketType.name,
            'Unit': isWantToSell
                ? unitPicker(index, ticketModel)
                : ticketModel.unit.toString(),
            'Set Price': isWantToSell
                ? pricePicker(index)
                : ticketModel.sellPrice.toString(),
          },
        ),
        10.height,
      ],
    );
  }

  Widget unitPicker(int index, TicketDetailsModel ticketModel) {
    final updatetedModel = sellInfo[index];

    return SizedBox(
      width: 100.w,
      height: 35.h,
      child: CommonTextField(
        key: Key('picker_1111111_${updatetedModel.unit.toString()}'),
        initialText: updatetedModel.unit.toString(),
        prefixIcon: GestureDetector(
          child: Icon(
            Icons.remove,
            color: updatetedModel.unit > 0
                ? AppColors.primaryColor
                : AppColors.greay300,
          ),
          onTap: () {
            if (updatetedModel.unit > 0) {
              sellInfo[index] = updatetedModel.copyWith(
                totalPurchaseTicket: updatetedModel.unit - 1,
              );
            }
            upadate();
          },
        ),
        suffixIcon: GestureDetector(
          child: Icon(
            Icons.add,
            color: updatetedModel.unit < ticketModel.unit
                ? AppColors.primaryColor
                : AppColors.greay300,
          ),
          onTap: () {
            if (updatetedModel.unit < ticketModel.unit) {
              sellInfo[index] = updatetedModel.copyWith(
                totalPurchaseTicket: updatetedModel.unit + 1,
              );
            }

            upadate();
          },
        ),
        borderRadius: 0,
        borderColor: AppColors.backgroundWhite,
        showValidationMessage: false,
        paddingVertical: 0,
        backgroundColor: AppColors.backgroundWhite,
        textAlign: TextAlign.center,
        isReadOnly: true,
        paddingHorizontal: 0,
        validationType: ValidationType.validateNumber,
      ),
    );
  }

  Widget pricePicker(int index) {
    return SizedBox(
      width: 100.w,
      height: 35.h,
      child: CommonTextField(
        initialText: sellInfo[index].sellPrice.toString(),
        prefixIcon: const Text('\$'),
        paddingVertical: 0,
        paddingHorizontal: 0,
        backgroundColor: AppColors.backgroundWhite,
        onChanged: (value) {
          sellInfo[index] = sellInfo[index].copyWith(
            totalPurchaseAmount: double.tryParse(value) ?? 0,
          );
          upadate();
        },
        showValidationMessage: false,
        validationType: ValidationType.validateCurrency,
      ),
    );
  }
}
