import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/organizer/createTicket/cubit/create_ticket_cubit.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';

class EventFormTicketSelctor extends StatelessWidget {
  const EventFormTicketSelctor({
    super.key,
    required this.createEventModel,
    required this.isReadOnly,
    required this.cubit,
  });
  final CreateEventModel createEventModel;
  final bool isReadOnly;
  final CreateTicketCubit cubit;

  @override
  Widget build(BuildContext context) {
    return _buildTicketForm(isReadOnly: isReadOnly);
  }

  Widget _buildCheckBox({
    required bool isReadOnly,
    required Function(bool?) onChanged,
    bool? value,
  }) {
    return Checkbox(
      side: BorderSide(
        width: 2.w,
        color: (isReadOnly ? false : (value ?? cubit.state.createEventModel.isFreeEvent))
            ? AppColors.primaryColor
            : AppColors.greay300,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      value: isReadOnly ? false : (value ?? cubit.state.createEventModel.isFreeEvent),
      onChanged: (value) {
        if (isReadOnly) return;
        onChanged(value);
      },
    );
  }

  Widget _buildTicketForm({required bool isReadOnly}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h), 
      decoration: BoxDecoration(
        color: AppColors.white400,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Table(
        
        children: [
          TableRow(
            
            children: [
              CommonText(
                text: 'Type',
                fontSize: 14,
                left: 15,
                textColor: AppColors.greay300,
                alignment: MainAxisAlignment.center,
              ),
              CommonText(
                left: 10,
                fontSize: 14,
                text: 'Set Unit Price(\$)',
                textColor: AppColors.greay300,
                alignment: MainAxisAlignment.center,
              ),
              CommonText(
                left: 10,
                fontSize: 14,
                text: 'Available Unit',
                textColor: AppColors.greay300,
                alignment: MainAxisAlignment.center,
              ),
            ],
          ),
          _buildTicketFormRow(isReadOnly: isReadOnly, ticketName: TicketName.premium),
          _buildTicketFormRow(isReadOnly: isReadOnly, ticketName: TicketName.vip),
          _buildTicketFormRow(isReadOnly: isReadOnly, ticketName: TicketName.standard),
          _buildTicketFormRow(isReadOnly: isReadOnly, ticketName: TicketName.other),
        ],
      ),
    );
  }

  TableRow _buildTicketFormRow({required bool isReadOnly, required TicketName ticketName}) {
    return TableRow(
      children: [
        Row(
          children: [
            _buildCheckBox(
              isReadOnly: isReadOnly,
              value:
                  cubit.state.createEventModel.ticketTypes.indexWhere(
                    (e) => e.name == ticketName,
                  ) !=
                  -1,
              onChanged: (value) {
                cubit.updateTicket(ticketName: ticketName, isSelected: value);
              },
            ),
            CommonText(text: ticketName.name.capitalizeEachWord(), fontSize: 16),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
          child: SizedBox(
            height: 35.h,
            child: CommonTextField(
              paddingVertical: 0,
              validationType: ValidationType.validateCurrency,
              backgroundColor: cubit.state.createEventModel.isFreeEvent
                  ? AppColors.white100
                  : AppColors.backgroundWhite,
              isReadOnly: isReadOnly,
              borderColor: AppColors.backgroundWhite,
              onSaved: (value, controller) {
                cubit.updateTicket(ticketName: ticketName, unitPrice: double.tryParse(value));
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
          child: SizedBox(
            height: 35.h,
            child: CommonTextField(
              paddingVertical: 0,
              validationType: ValidationType.validateNumber,
              backgroundColor: cubit.state.createEventModel.isFreeEvent
                  ? AppColors.white100
                  : AppColors.backgroundWhite,
              borderColor: AppColors.backgroundWhite,
              isReadOnly: isReadOnly,
              onSaved: (value, controller) {
                cubit.updateTicket(ticketName: ticketName, availableUnit: int.tryParse(value));
              },
            ),
          ),
        ),
      ],
    );
  }
}
