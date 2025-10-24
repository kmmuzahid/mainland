import 'package:equatable/equatable.dart';

class EventDetailsState extends Equatable {
  const EventDetailsState({
    this.showDetails = false,
    this.details = '',
  });
  final bool showDetails;
  final String details;

  @override
  List<Object?> get props => [showDetails];
}
