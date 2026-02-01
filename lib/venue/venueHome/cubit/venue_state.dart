// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'venue_cubit.dart';

class VenueState {
  const VenueState({
    required this.eventCode,
    this.currentIndex = 0,
    this.eventDetailsModel,
    this.image,
    this.isEventDetailsLoading = false,
    this.openCamera = false,
    this.venueHistoryModel,
    this.isHistoryLoading = false,
    this.isQrChecking = false,
    this.isEventCodeChecking = false,
    this.availableTickets = const [],
    this.isSoundOn = true,
    this.isVibrateOn = false,
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
  final String eventCode;
  final bool isEventCodeChecking;
  final bool isSoundOn;
  final bool isVibrateOn;

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
    String? eventCode,
    bool? isEventCodeChecking,
    bool? isSoundOn,
    bool? isVibrateOn,
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
      availableTickets: availableTickets ?? this.availableTickets,
      eventCode: eventCode ?? this.eventCode,
      isEventCodeChecking: isEventCodeChecking ?? this.isEventCodeChecking,
      isSoundOn: isSoundOn ?? this.isSoundOn,
      isVibrateOn: isVibrateOn ?? this.isVibrateOn,
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
        other.eventCode == eventCode &&
        other.isEventCodeChecking == isEventCodeChecking &&
        other.availableTickets == availableTickets &&
        other.isSoundOn == isSoundOn &&
        other.isVibrateOn == isVibrateOn;
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
        eventCode.hashCode ^
        isEventCodeChecking.hashCode ^
        availableTickets.hashCode ^
        isSoundOn.hashCode ^
        isVibrateOn.hashCode;
  }
}
