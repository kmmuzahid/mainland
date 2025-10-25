import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';

class CreateTicketState extends Equatable {
  final int currentPage;
  final bool isExpandedView;
  final CreateEventModel createEventModel;
  final XFile? image;

  const CreateTicketState({
    this.currentPage = 0,
    this.isExpandedView = false,
    required this.createEventModel,
    this.image,
  });

  CreateTicketState copyWith({
    int? currentPage,
    bool? isExpandedView,
    CreateEventModel? createEventModel,
    XFile? image,
  }) {
    return CreateTicketState(
      currentPage: currentPage ?? this.currentPage,
      isExpandedView: isExpandedView ?? this.isExpandedView,
      createEventModel: createEventModel ?? this.createEventModel,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [currentPage, isExpandedView, createEventModel, image?.path];
}
