import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainland/common/auth/widgets/required_icon_widget.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_multiline_text_field.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/custom_form.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';
import 'package:mainland/main.dart';
import 'package:mainland/organizer/createTicket/cubit/create_ticket_cubit.dart';
import 'package:mainland/organizer/createTicket/widgets/create_ticket_titlebar.dart';

import '../model/create_event_model.dart';

class TicketFormThree extends StatelessWidget {
  const TicketFormThree({
    super.key,
    required this.createEventModel,
    required this.isReadOnly,
    required this.cubit,
    required this.isExpanded,
  });
  final CreateEventModel createEventModel;
  final bool isReadOnly;
  final CreateTicketCubit cubit;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      builder: (context, formKey) {
        return Column(
          children: [
            CreateTicketTitlebar(title: 'Event Organizer details', showSaveButton: !isExpanded),
            CommonMultilineTextField(
              height: 117,
              initialText: createEventModel.organizerName,
              hintText: 'Event Organizer :\ne.g. FlyTime Music Festival',
              backgroundColor: AppColors.backgroundWhite,
              borderColor: AppColors.greay100,
              isReadOnly: isReadOnly,
              prefixIcon: const RequiredIconWidget(),
              onSaved: (value, controller) {
                cubit.updateField(cubit.state.createEventModel.copyWith(organizerName: value));
              },
              validationType: ValidationType.validateRequired,
            ),
            10.height,
            CommonTextField(
              initialText: createEventModel.emailAddress,
              isReadOnly: isReadOnly,
              borderColor: AppColors.greay100,
              backgroundColor: AppColors.backgroundWhite,
              prefixIcon: const RequiredIconWidget(),
              hintText: AppString.emailAddress,
              validationType: ValidationType.validateEmail,
              onSaved: (value, controller) {
                cubit.updateField(cubit.state.createEventModel.copyWith(emailAddress: value));
              },
            ),
            10.height,
            CommonTextField(
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonImage(width: 32, height: 24, imageSrc: Assets.images.usFlag.path),
                  10.width,
                  const RequiredIconWidget(),
                ],
              ),
              initialText: createEventModel.phoneNumber,
              isReadOnly: isReadOnly,
              borderColor: AppColors.greay100,
              backgroundColor: AppColors.backgroundWhite,
              hintText: 'XXX-XXX-XXXX',
              validationType: ValidationType.validatePhone,
              onSaved: (value, controller) {
                cubit.updateField(cubit.state.createEventModel.copyWith(phoneNumber: value));
              },
            ),
            20.height,
            if (!isExpanded)
              CommonButton(
                titleText: 'Review',
                onTap: () {
                  context.read<CreateTicketCubit>().toggleView();
                },
              ).center,

            if (isExpanded)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonButton(
                    buttonWidth: 115,
                    titleText: 'Edit',
                    onTap: () {
                      if (isReadOnly) cubit.updateReadOnly();
                      showSnackBar('Edit mode enabled', type: SnackBarType.success);
                    },
                  ),
                  10.width,
                  CommonButton(buttonWidth: 115, titleText: 'Preview', onTap: () {}),
                  10.width,
                  CommonButton(buttonWidth: 115, titleText: 'Submit', onTap: () {}),
                ],
              ),
            30.height,
          ],
        );
      },
    );
  }
}
