import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/component/text/common_text.dart';
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

  @override
  void initState() {
    super.initState();
    unitController = TextEditingController();
    priceController = TextEditingController();
  }

  @override
  void dispose() {
    unitController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            'Unit': widget.unit.toString(),
            'Set Price': widget.price.toString(),
          },
        ),
        10.height,
        CommonText(
          preffix: SizedBox(
            width: 100.w,
            child: Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text('*', style: AppTextStyles.titleMedium?.copyWith(color: AppColors.error)),
              ],
            ),
          ),
          text: AppString
              .mainlandCharges10CommissionOnAllSaleYourTicketWillBecomeAvailableUnderAttendeeTicketSaleIfSoldItWillBeInvalidatedAndReissuedToTheBuyer,
          fontSize: 14,
          fontWeight: FontWeight.w300,
          top: 10,
          bottom: 10,
        ),
        CommonButton(
          titleText: isWantToSell ? AppString.sellNow : AppString.sellTicket,
          onTap: () {
            setState(() {
              isWantToSell = true;
            });
          },
        ),
      ],
    );
  }
}
