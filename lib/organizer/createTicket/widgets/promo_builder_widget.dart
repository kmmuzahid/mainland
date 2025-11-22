import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/organizer/createTicket/cubit/create_ticket_cubit.dart';

class PromoBuilderWidget extends StatefulWidget {
  const PromoBuilderWidget({
    super.key,
    required this.cubit,
    required this.isReadOnly,
    required this.onSaved,
  });
  final CreateTicketCubit cubit;
  final bool isReadOnly;
  final Function(String code, int discount) onSaved;

  @override
  State<PromoBuilderWidget> createState() => _PromoBuilderWidgetState();
}

class _PromoBuilderWidgetState extends State<PromoBuilderWidget> {
  late TextEditingController promoCodeController;
  late TextEditingController promoCodeDiscountController;

  @override
  void initState() {
    super.initState();
    promoCodeController = TextEditingController();
    promoCodeDiscountController = TextEditingController();
  }

  @override
  void dispose() {
    promoCodeController.dispose();
    promoCodeDiscountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _promoBuilder();
  }

  Widget _promoBuilder() {
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            controller: promoCodeController,
            hintText: 'Promo Code',
            showValidationMessage: false,
            maxLength: 10,
            isReadOnly:
                widget.isReadOnly ||
                widget.cubit.state.createEventModel.isFreeEvent ||
                !widget.cubit.state.createEventModel.offerPreSale,
            validationType: ValidationType.validateAlphaNumeric,
            backgroundColor: AppColors.backgroundWhite,
          ),
        ),
        SizedBox(
          width: 30.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextField(
                paddingHorizontal: 0,
                initialText: '%',
                textAlign: TextAlign.center,
                showValidationMessage: false,
                validationType: ValidationType.validateCurrency,
                isReadOnly: true,
                borderColor: AppColors.background,
                backgroundColor: AppColors.background,
              ),
              20.height,
            ],
          ),
        ),
        SizedBox(
          width: 70.w,
          child: CommonTextField(
            controller: promoCodeDiscountController,
            hintText: '10',
            isReadOnly:
                widget.isReadOnly ||
                widget.cubit.state.createEventModel.isFreeEvent ||
                !widget.cubit.state.createEventModel.offerPreSale,
            onSaved: (value, controller) {
              widget.onSaved(promoCodeController.text, int.tryParse(value.trim()) ?? 0);
            },
            showValidationMessage: false,
            maxLength: 2,
            validationType: ValidationType.validateCurrency,
            backgroundColor: AppColors.backgroundWhite,
          ),
        ),
      ],
    );
  }
}
