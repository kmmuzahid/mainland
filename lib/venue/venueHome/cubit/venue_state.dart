// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'venue_cubit.dart';

class VenueState {
  const VenueState({
    this.currentIndex = 0,
    this.eventDetailsModel,
    this.image,
    this.isEventDetailsLoading = false,
    this.openCamera = false,
    this.venueHistoryModel,
    this.isHistoryLoading = false,
    this.isQrChecking = false,
    this.availableTickets = const []
  });

  final int currentIndex;
  final EventDetailsModel? eventDetailsModel;
  final bool isEventDetailsLoading;
  final XFile? image;
  final bool openCamera;
  final bool isHistoryLoading;
  final bool isQrChecking;
  final VenuHistoryModel? venueHistoryModel;
  final List<Ticket>? availableTickets;
  

  VenueState copyWith({
    int? currentIndex,
    EventDetailsModel? eventDetailsModel,
    bool? isEventDetailsLoading,
    bool? openCamera,
    XFile? image,
    VenuHistoryModel? venueHistoryModel,
    bool? isHistoryLoading,
    bool? isQrChecking,
    List<Ticket>? availableTickets,
  }) {
    return VenueState(
      currentIndex: currentIndex ?? this.currentIndex,
      eventDetailsModel: eventDetailsModel ?? this.eventDetailsModel,
      isEventDetailsLoading: isEventDetailsLoading ?? this.isEventDetailsLoading,
      image: image ?? this.image,
      openCamera: openCamera ?? this.openCamera,
      venueHistoryModel: venueHistoryModel ?? this.venueHistoryModel,
      isHistoryLoading: isHistoryLoading ?? this.isHistoryLoading,
      isQrChecking: isQrChecking ?? this.isQrChecking,
      availableTickets: availableTickets ?? this.availableTickets
    );
  }

  @override
  bool operator ==(covariant VenueState other) {
    if (identical(this, other)) return true;

    return other.currentIndex == currentIndex &&
        other.eventDetailsModel == eventDetailsModel &&
        other.isEventDetailsLoading == isEventDetailsLoading &&
        other.image == image &&
        other.openCamera == openCamera &&
        other.venueHistoryModel == venueHistoryModel &&
        other.isHistoryLoading == isHistoryLoading &&
        other.isQrChecking == isQrChecking &&
        other.availableTickets == availableTickets;
  }

  @override
  int get hashCode {
    return currentIndex.hashCode ^
        eventDetailsModel.hashCode ^
        isEventDetailsLoading.hashCode ^
        image.hashCode ^
        openCamera.hashCode ^
        venueHistoryModel.hashCode ^
        isHistoryLoading.hashCode ^
        isQrChecking.hashCode ^
        availableTickets.hashCode;
  }
}
