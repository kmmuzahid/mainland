import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text_field/custom_form.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/organizer/createTicket/cubit/create_ticket_cubit.dart';

class TicketFormTwo extends StatelessWidget {
  const TicketFormTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      builder: (context, formKey) {
        return Column(
          children: [
            20.height,
            CommonButton(
              titleText: AppString.next,
              onTap: () {
                context.read<CreateTicketCubit>().nextPage();
              },
            ).center,
            30.height,
          ],
        );
      },
    );
  }
}
