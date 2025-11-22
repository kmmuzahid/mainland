// form_cubit.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:mainland/core/component/other_widgets/permission_handler_helper.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/main.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
import 'package:permission_handler/permission_handler.dart';

import 'create_ticket_state.dart';

class CreateTicketCubit extends SafeCubit<CreateTicketState> {
  CreateTicketCubit()
    : super(
        CreateTicketState(
          createEventModel: CreateEventModel.empty(),
          draftEventModel: CreateEventModel.empty(),
        ),
      );
  final ImagePicker _imagePicker = ImagePicker();
  // Navigate to next page
  void saveDraft() async {
    AppLogger.debug(state.createEventModel.toJson().toString());
    // appRouter.replaceAll([const HomeRoute()]);
  }

  void updatePromoCode({
    required String code,
    required int discountPercentage,
    required String filedId,
  }) {
    //if state.createEventModel.discountCodes has filedId already
    //then update that object
    //else add new object
    final List<DiscountCodeModel> discountCodes = List.from(state.createEventModel.discountCodes);
    final index = discountCodes.indexWhere((element) => element.filedId == filedId);
    if (index != -1) {
      discountCodes[index] = DiscountCodeModel(
        code: code,
        discountPercentage: discountPercentage,
        filedId: filedId,
      );
    } else {
      discountCodes.add(
        DiscountCodeModel(code: code, discountPercentage: discountPercentage, filedId: filedId),
      );
    }
    emit(
      state.copyWith(
        createEventModel: state.createEventModel.copyWith(discountCodes: discountCodes),
      ),
    );
  }

  void submit() async {
    AppLogger.debug(state.createEventModel.toString());
    appRouter.replaceAll([const HomeRoute()]);
  }

  void fetchDraft() {
    emit(
      state.copyWith(
        draftEventModel: state.createEventModel.copyWith(
          title: '''Juice WRLD Mon. Jan. 12, 8pm Eko Hotel & Suites Pre Order available Nov. 1''',
        ),
      ),
    );
  }

  void nextPage() {
    if (state.currentPage < 2) {
      emit(state.copyWith(currentPage: state.currentPage + 1));
    }
  }

  void updateReadOnly() {
    emit(state.copyWith(isReadOnly: !state.isReadOnly));
  }

  // Navigate to previous page
  void previousPage() {
    if (state.currentPage > 0) {
      emit(state.copyWith(currentPage: state.currentPage - 1));
    }
  }

  // Toggle between page view and expanded view
  void toggleView() {
    updateReadOnly();
    emit(state.copyWith(isExpandedView: !state.isExpandedView));
  }

  // Update form field
  void updateField(CreateEventModel model) {
    emit(state.copyWith(createEventModel: model));
  }

  void removeSubCategory(int index) {
    final List<String> list = List.from(state.createEventModel.selectedSubcategories);
    list.removeAt(index);
    emit(
      state.copyWith(
        createEventModel: state.createEventModel.copyWith(selectedSubcategories: list),
      ),
    );
  }

  // Submit form
  Future<void> submitForm() async {
    print('Form Data: ${state.createEventModel}');
    // Add your submission logic here
    // Example: await apiService.submitForm(state.createEventModel);
  }

  Future<void> updateTicket({
    required TicketName ticketName,
    int? availableUnit,
    bool? isSelected,
    double? unitPrice,
  }) async {
    if (isSelected == false) {
      final List<TicketTypeModel> tickets = List.from(state.createEventModel.ticketTypes);
      tickets.removeWhere((element) => element.name == ticketName);
      emit(state.copyWith(createEventModel: state.createEventModel.copyWith(ticketTypes: tickets)));
    }

    final TicketTypeModel existingTicket = state.createEventModel.ticketTypes.firstWhere(
      (element) => element.name == ticketName,
      orElse: TicketTypeModel.empty,
    );

    final isSelectedTicket = (existingTicket.name == ticketName) || (isSelected ?? false);

    if (!(existingTicket.name == ticketName) && isSelected == true) {
      //create
      emit(
        state.copyWith(
          createEventModel: state.createEventModel.copyWith(
            ticketTypes: [
              ...state.createEventModel.ticketTypes,
              TicketTypeModel(
                name: ticketName,
                availableUnit: availableUnit ?? 0,
                setUnitPrice: unitPrice ?? 0,
              ),
            ],
          ),
        ),
      );
    } else if (isSelectedTicket) {
      //update
      final newTicket = existingTicket.copyWith(
        availableUnit: availableUnit ?? existingTicket.availableUnit,
        setUnitPrice: unitPrice ?? existingTicket.setUnitPrice,
      );

      // copy all tickets as list. later remove existing ticket. then add newticket and emit
      final List<TicketTypeModel> tickets = List.from(state.createEventModel.ticketTypes);
      tickets.removeWhere((element) => element.name == ticketName);
      tickets.add(newTicket);
      emit(state.copyWith(createEventModel: state.createEventModel.copyWith(ticketTypes: tickets)));
    }
  }

  Future<void> pickImage({bool isAttachment = true}) async {
    if (state.isReadOnly) return;
    final status = await const PermissionHandlerHelper(permission: Permission.photos).getStatus();
    if (status) {
      final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (checkImageResolution(pickedFile.path)) {
          emit(state.copyWith(image: pickedFile));
        } else {
          showSnackBar('Image resolution is not valid', type: SnackBarType.error);
        }
      }
    }
  }

  bool checkImageResolution(String path) {
    final image = img.decodeImage(File(path).readAsBytesSync());
    if (image != null) {
      return (image.width == 1080 && image.height == 1920);
    }
    return false;
  }
}
