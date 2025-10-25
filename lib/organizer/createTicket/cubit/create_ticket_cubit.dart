// form_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mainland/core/component/other_widgets/permission_handler_helper.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:flutter/material.dart';
import 'package:mainland/main.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
import 'create_ticket_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image/image.dart' as img;
import 'dart:io';

class CreateTicketCubit extends SafeCubit<CreateTicketState> {
  CreateTicketCubit() : super(CreateTicketState(createEventModel: CreateEventModel.empty()));
  final ImagePicker _imagePicker = ImagePicker();
  // Navigate to next page
  void nextPage() {
    if (state.currentPage < 2) {
      emit(state.copyWith(currentPage: state.currentPage + 1));
    }
  }

  // Navigate to previous page
  void previousPage() {
    if (state.currentPage > 0) {
      emit(state.copyWith(currentPage: state.currentPage - 1));
    }
  }

  // Go to specific page
  void goToPage(int page) {
    if (page >= 0 && page <= 2) {
      emit(state.copyWith(currentPage: page));
    }
  }

  // Toggle between page view and expanded view
  void toggleView() {
    emit(state.copyWith(isExpandedView: !state.isExpandedView));
  }

  // Update form field
  void updateField(CreateEventModel model) {
    emit(state.copyWith(createEventModel: model));
  }

  // Update multiple fields at once
  void updateFields(CreateEventModel model) {
    emit(state.copyWith(createEventModel: model));
  }

  // Clear all form data
  void clearForm() {
    emit(
      state.copyWith(
        currentPage: 0,
        isExpandedView: false,
        createEventModel: CreateEventModel.empty(),
      ),
    );
  }

  // Submit form
  Future<void> submitForm() async {
    print('Form Data: ${state.createEventModel}');
    // Add your submission logic here
    // Example: await apiService.submitForm(state.createEventModel);
  }

  Future<void> pickImage({bool isAttachment = true}) async {
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
