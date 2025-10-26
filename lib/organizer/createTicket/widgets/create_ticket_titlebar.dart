import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/organizer/createTicket/cubit/create_ticket_cubit.dart';

class CreateTicketTitlebar extends StatelessWidget {
  const CreateTicketTitlebar({this.title, this.titleWidget, this.showSaveButton = true, super.key});
  final String? title;
  final Widget? titleWidget;
  final bool showSaveButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (titleWidget != null) titleWidget!,
        if (title != null) CommonText(text: title!, fontSize: 18, fontWeight: FontWeight.w600),
        const Spacer(),
        if (showSaveButton)
        CommonButton(
          buttonColor: AppColors.background,
          titleColor: AppColors.primaryColor,
          titleText: 'Save Draft',
            onTap: () {
              context.read<CreateTicketCubit>().saveDraft();
            },
        ),
      ],
    );
  }
}
