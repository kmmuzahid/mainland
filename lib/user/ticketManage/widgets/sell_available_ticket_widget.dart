import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/custom_form.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/main.dart';
import 'package:mainland/user/ticketManage/widgets/ticket_summery_view_widget.dart';

class SellAvailableTicketWidget extends StatefulWidget {
  const SellAvailableTicketWidget({
    super.key,
    required this.eventName,
    required this.type,
    required this.unit,
    required this.price,
    required this.onSell,
  });
  final String eventName;
  final String type;
  final int unit;
  final double price;
  final Function(int unit, double price) onSell;

  @override
  State<SellAvailableTicketWidget> createState() => _SellAvailableTicketWidgetState();
}

class _SellAvailableTicketWidgetState extends State<SellAvailableTicketWidget> {
  int unit = 0;
  double price = 0;
  bool isWantToSell = false;
  late TextEditingController unitController;
  late TextEditingController priceController;
  bool isAgree = false;
  bool isDisAgree = false;

  @override
  void initState() {
    super.initState();
    unitController = TextEditingController(text: '0');
    priceController = TextEditingController(text: '0');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      builder: (contex, formKey) => Column(
        children: [
          SizedBox(
            width: Utils.deviceSize.width * .6,
            child: CommonText(
              text: widget.eventName,
              style: AppTextStyles.titleLarge,
              textColor: AppColors.primaryColor,
              textAlign: TextAlign.left,
              alignment: MainAxisAlignment.start,
            ),
          ).start,
          10.height,
          CommonText(text: AppString.ticketDetails, style: AppTextStyles.titleMedium).start,
          10.height,
          TicketSummeryViewWidget(
            backgroundColor: AppColors.primary50,
            summery: {
              'Type': widget.type,
              'Unit': isWantToSell ? unitPicker() : widget.unit.toString(),
              'Set Price': isWantToSell ? pricePicker() : widget.price.toString(),
            },
          ),
          10.height,
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
                    setState(() {
                      isDisAgree = false;
                      isAgree = value ?? false;
                    });
                  },
                ),
                CommonText(top: 8, text: '*', textColor: AppColors.error, fontSize: 18),
                Expanded(
                  child: CommonText(
                    textAlign: TextAlign.left,
                    text: AppString
                        .mainlandCharges10CommissionOnAllSaleYourTicketWillBecomeAvailableUnderAttendeeTicketSaleIfSoldItWillBeInvalidatedAndReissuedToTheBuyer,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    top: 10,
                    bottom: 10,
                  ),
                ),
              ],
            ),

          CommonButton(
            titleText: isWantToSell ? AppString.sellNow : AppString.sellTicket,
            onTap: () {
              if (isWantToSell) {
                if (!isAgree) {
                  isDisAgree = true;
                }
                if (isAgree && formKey.currentState!.validate()) {
                  final unit = int.tryParse(unitController.text);
                  final price = double.tryParse(priceController.text);
                  if (unit != null && unit > 0 && price != null && price > 0) {
                    widget.onSell(unit, price);
                  }
                } else {
                  showSnackBar('Please ensure all required field', type: SnackBarType.error);
                }
              }
              isWantToSell = true;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget unitPicker() {
    return SizedBox(
      width: 77.w,
      height: 35.h,
      child: CommonTextField(
        prefixIcon: GestureDetector(
          child: CommonText(
            text: '-',
            fontSize: 24,
            textColor: unit > 0 ? null : AppColors.greay300,
            fontWeight: FontWeight.w600,
          ),
          onTap: () {
            setState(() {
              if (unit > 0) {
                unit--;
                unitController.text = unit.toString();
              }
            });
          },
        ),
        suffixIcon: GestureDetector(
          child: CommonText(
            text: '+',
            fontSize: 24,
            textColor: unit < widget.unit ? null : AppColors.greay300,
            fontWeight: FontWeight.w600,
          ),
          onTap: () {
            setState(() {
              if (unit < widget.unit) {
                unit++;
                unitController.text = unit.toString();
              }
            });
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
        controller: unitController,
      ),
    );
  }

  Widget pricePicker() {
    return SizedBox(
      width: 77.w,
      height: 35.h,
      child: CommonTextField(
        prefixIcon: const Text('\$'),
        paddingVertical: 0,
        paddingHorizontal: 0,
        backgroundColor: AppColors.backgroundWhite,
        showValidationMessage: false,
        validationType: ValidationType.validateCurrency,
        controller: priceController,
      ),
    );
  }
}
