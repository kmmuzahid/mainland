// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'venue_cubit.dart';

class VenueState {
  const VenueState({
    this.currentIndex = 0,
    this.eventDetailsModel,
    this.image,
    this.isEventDetailsLoading = false,
  });

  final int currentIndex;
  final EventDetailsModel? eventDetailsModel;
  final bool isEventDetailsLoading;
  final XFile? image;
 

  VenueState copyWith({
    int? currentIndex,
    EventDetailsModel? eventDetailsModel,
    bool? isEventDetailsLoading,
    XFile? image,
  }) {
    return VenueState(
      currentIndex: currentIndex ?? this.currentIndex,
      eventDetailsModel: eventDetailsModel,
      isEventDetailsLoading: isEventDetailsLoading ?? this.isEventDetailsLoading,
      image: image,
    );
  }

  @override
  bool operator ==(covariant VenueState other) {
    if (identical(this, other)) return true;

    return other.currentIndex == currentIndex &&
        other.eventDetailsModel == eventDetailsModel &&
        other.isEventDetailsLoading == isEventDetailsLoading &&
        other.image == image;
  }

  @override
  int get hashCode {
    return currentIndex.hashCode ^
        eventDetailsModel.hashCode ^
        isEventDetailsLoading.hashCode ^
        image.hashCode;
  }
}
