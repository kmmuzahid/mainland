// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
enum TicketFilter { Live, Available, Sold, Expired, Upcoming, Used, UnderReview, Draft, Closed }

class TicketModel {
  final String title;
  final bool isAvailable;
  final String image;
  final String eventId;
  TicketModel({
    required this.title,
    required this.isAvailable,
    required this.image,
    required this.eventId,
  });

  TicketModel copyWith({String? title, bool? isAvailable, String? image, String? eventId}) {
    return TicketModel(
      title: title ?? this.title,
      isAvailable: isAvailable ?? this.isAvailable,
      image: image ?? this.image,
      eventId: eventId ?? this.eventId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isAvailable': isAvailable,
      'image': image,
      'eventId': eventId,
    };
  }

  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      title: map['title'] as String,
      isAvailable: map['isAvailable'] as bool,
      image: map['image'] as String,
      eventId: map['eventId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketModel.fromJson(String source) =>
      TicketModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TicketModel(title: $title, isAvailable: $isAvailable, image: $image, eventId: $eventId)';
  }

  @override
  bool operator ==(covariant TicketModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.isAvailable == isAvailable &&
        other.image == image &&
        other.eventId == eventId;
  }

  @override
  int get hashCode {
    return title.hashCode ^ isAvailable.hashCode ^ image.hashCode ^ eventId.hashCode;
  }
}
