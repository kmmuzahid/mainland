import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mainland/common/auth/model/us_states_model.dart';
import 'package:mainland/common/auth/widgets/required_icon_widget.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/other_widgets/common_drop_down.dart';
import 'package:mainland/core/component/other_widgets/dotted_border_container.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'time_input_card.dart';
import 'package:mainland/core/component/other_widgets/dual_field_row_widget.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_date_input_text_field.dart';
import 'package:mainland/core/component/text_field/common_multiline_text_field.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/custom_form.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/organizer/createTicket/cubit/create_ticket_cubit.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
import 'package:mainland/organizer/createTicket/widgets/create_ticket_titlebar.dart';
import 'package:mainland/organizer/createTicket/widgets/form_label.dart';

import '../cubit/create_ticket_state.dart';
import 'time_input_card.dart';

class TicketFormOne extends StatelessWidget {
  const TicketFormOne({
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isExpanded || createEventModel.title?.isNotEmpty == true
                ? CreateTicketTitlebar(
                    title: 'Event Details',
                    showSaveButton: false,
                    formKey: formKey,
                  )
                : _title(formKey),
            FormLabel(isRequired: true, label: 'Event Images'),
            _imagePickerBuilder(),
            10.height,
            FormLabel(isRequired: true, label: 'Event Title'),
            _textEditor(
              onSaved: (value, controller) {
                cubit.updateField(cubit.state.createEventModel.copyWith(title: value));
              },
              hintText: 'Event Title',
              maxWords: 50,
              initalText: createEventModel.title,
              validationType: ValidationType.validateRequired,
            ),
            const FormLabel(isRequired: true, label: 'Event Category'),
            CommonButton(
              titleColor: AppColors.primaryColor,
              buttonColor: AppColors.backgroundWhite,
              borderColor: AppColors.primaryColor,
              titleText: 'Category',
              onTap: () async {
                final result = await appRouter.push(
                  PreferenceRoute(
                    backgroundColor: AppColors.background,
                    header: Row(
                      children: [
                        CommonText(
                          text: 'Select Category & Sub-Category',
                          textAlign: TextAlign.left,
                          alignment: MainAxisAlignment.start,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    buttonTitle: 'Done',
                  ),
                );
                if (result is MapEntry) {
                  AppLogger.debug(result.toString());
                  cubit.updateField(
                    cubit.state.createEventModel.copyWith(
                      selectedCategory: result.key,
                      selectedSubcategories: result.value,
                    ),
                  );
                }
              },
            ),

            if (cubit.state.createEventModel.selectedSubcategories.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: cubit.state.createEventModel.selectedSubcategories.map((subCategory) {
                    final index = cubit.state.createEventModel.selectedSubcategories.indexOf(
                      subCategory,
                    );
                    return CommonText(
                      suffix: GestureDetector(
                        onTap: () {
                          cubit.removeSubCategory(index); // correct index in the list
                        },
                        child: Icon(Icons.close, size: 20.w),
                      ),
                      backgroundColor: AppColors.primaryColor,
                      top: 8,
                      bottom: 8,
                      left: 15,
                      fontSize: 14,
                      borderRadious: 8,
                      text: subCategory.subcategoryTitle,
                    );
                  }).toList(),
                ),
              ),

            10.height,
            FormLabel(isRequired: true, label: 'Event Description'),
            CommonMultilineTextField(
              isReadOnly: isReadOnly,
              height: 200,
              maxWords: 150,

              onSaved: (value, controller) {
                cubit.updateField(cubit.state.createEventModel.copyWith(description: value));
              },
              backgroundColor: AppColors.backgroundWhite,
              validationType: ValidationType.validateRequired,
              initialText: createEventModel.description,
              enableHtml: true,
            ),
            const FormLabel(isRequired: true, label: 'Event Date'),
            CommonDateInputTextField(
              minDate: DateTime.now(),
              initialValue: createEventModel.eventDate?.toLocal().toString().split(' ')[0],
              isReadOnly: isReadOnly,
              onSave: (value) {
                cubit.updateField(
                  cubit.state.createEventModel.copyWith(eventDate: value),
                );
              },
              backgroundColor: AppColors.backgroundWhite,
            ),
            10.height,
            const Row(
              children: [
                Expanded(child: FormLabel(isRequired: true, label: 'Start Time')),
                Expanded(child: FormLabel(isRequired: true, label: 'End Time')),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TimeInputCard(
                    initialTime: cubit.state.createEventModel.startTime ?? TimeOfDay.now(),
                    onChanged: (value) {
                      cubit.updateField(cubit.state.createEventModel.copyWith(startTime: value));
                    },
                  ),
                ),
                10.width,
                Expanded(
                  child: TimeInputCard(
                    initialTime: cubit.state.createEventModel.endTime ?? TimeOfDay.now(),
                    onChanged: (value) {
                      cubit.updateField(cubit.state.createEventModel.copyWith(endTime: value));
                    },
                  ),
                ),
              ],
            ),

            10.height,
            FormLabel(isRequired: true, label: 'Street Address 1'),
            _textEditor(
              onSaved: (value, controller) {
                cubit.updateField(cubit.state.createEventModel.copyWith(streetAddress1: value));
              },
              hintText: 'Apt. 1A/Suite 1A/Unit 1A',
              validationType: ValidationType.validateRequired,
              initalText: createEventModel.streetAddress1,
            ),
            10.height,
            FormLabel(isRequired: false, label: 'Street Address 2'),
            _textEditor(
              onSaved: (value, controller) {
                cubit.updateField(cubit.state.createEventModel.copyWith(streetAddress2: value));
              },
              hintText: 'Apt. 1A/Suite 1A/Unit 1A',
              validationType: ValidationType.notRequired,
              initalText: createEventModel.streetAddress2,
            ),
            10.height,
            FormLabel(isRequired: true, label: AppString.city),
            _textEditor(
              onSaved: (value, controller) {
                cubit.updateField(cubit.state.createEventModel.copyWith(city: value));
              },
              hintText: AppString.city,
              initalText: createEventModel.city,
              validationType: ValidationType.validateFullName,
            ),
            10.height,
            FormLabel(isRequired: true, label: AppString.state),
            CommonDropDown<MapEntry<String, String>>( 
              hint: AppString.state,
              items: usStates.entries.toList(),
              textStyle: AppTextStyles.bodyMedium,
              borderColor: AppColors.greay100,
              initalValue:
                  usStates.isNotEmpty &&
                      createEventModel.state != null &&
                      createEventModel.state!.isNotEmpty
                  ? usStates.entries.firstWhere(
                      (element) => element.value == createEventModel.state?.trim(),
                    )
                  : null,
              enableInitalSelection: false,
              backgroundColor: AppColors.backgroundWhite,
              isRequired: true,
              onChanged: (states) {
                cubit.updateField(cubit.state.createEventModel.copyWith(state: states?.value));
              },
              nameBuilder: (states) {
                return states.value;
              },
            ),
            10.height,
            const FormLabel(isRequired: true, label: 'Country'),
            _textEditor(
              onSaved: (value, controller) {
                cubit.updateField(cubit.state.createEventModel.copyWith(country: 'United States'));
              },
              isReadOnly: true,
              initalText: null,
              hintText: 'United States',
              validationType: ValidationType.notRequired,
            ),
            if (!isExpanded) ...[
              20.height,
              CommonButton(
                titleText: AppString.next,
                onTap: () {
                  formKey.currentState?.save();
                  if (formKey.currentState?.validate() ?? false) {
                    cubit.nextPage();
                  }
                },
              ).center,
              30.height,
            ],
          ],
        );
      },
    );
  }

  Widget _imagePickerBuilder() {
    return BlocBuilder<CreateTicketCubit, CreateTicketState>(
      builder: (context, state) {
        final picker = DashedBorderContainer(
          borderRadius: 12,
          dashWidth: 10,
          dashSpace: 5,
          child: Container(
            height: 114.h,
            width: double.infinity,
            margin: EdgeInsets.all(1.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.backgroundWhite,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.image != null || state.draftEventModel.image != null)
                  SizedBox(
                    width: 60.h,
                    height: 60.h,
                    child: CommonImage(imageSrc: state.image?.path ?? state.draftEventModel.image!),
                  ),
                if (state.image == null && state.draftEventModel.image == null)
                  const Icon(Icons.image_outlined),
                CommonText(
                  text: cubit.state.image == null
                      ? 'Choose File'
                      : cubit.state.image!.path.split('/').last,
                  fontSize: 14,
                ),
                const CommonText(text: 'Image resolution must be 1080 x 1920 px', fontSize: 12),
              ],
            ),
          ),
        );
        return GestureDetector(onTap: cubit.pickImage, child: picker);
      },
    );
  }

  CommonTextField _textEditor({
    required Function(String, TextEditingController) onSaved,
    required String hintText,
    required String? initalText,
    required ValidationType validationType,
    int? maxWords,
    bool? isReadOnly,
  }) {
    return CommonTextField(
      initialText: initalText,
      borderColor: AppColors.greay100,
      isReadOnly: isReadOnly ?? this.isReadOnly,
      backgroundColor: AppColors.backgroundWhite,
      hintText: hintText,
      maxWords: maxWords,
      validationType: validationType,
      onSaved: onSaved,
    );
  }

  CreateTicketTitlebar _title(GlobalKey<FormState> formKey) {
    return CreateTicketTitlebar(
      formKey: formKey,
      titleWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: AppString.create,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            textHeight: 24,
          ),
          CommonText(text: AppString.aNewTicketEvent, fontSize: 18, textHeight: 24),
        ],
      ),
    );
  }
}
