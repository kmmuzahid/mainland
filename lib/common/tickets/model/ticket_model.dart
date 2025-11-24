 
enum TicketFilter { Live, Available, Sold, Expired, Upcoming, Used, UnderReview, Draft, Closed }
class TicketModel {
  final String id;
  final String eventName;
  final String image;
  final DateTime eventDate;
  final String streetAddress;
  final String streetAddress2;
  final DateTime ticketSaleStart;
  final DateTime preSaleStart;
  final bool isFreeEvent;

  TicketModel({
    required this.id,
    required this.eventName,
    required this.image,
    required this.eventDate,
    required this.streetAddress,
    required this.streetAddress2,
    required this.ticketSaleStart,
    required this.preSaleStart,
    required this.isFreeEvent,
  });

  // From JSON
  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['_id'] ?? '',
      eventName: json['eventName'] ?? '',
      image: json['image'] ?? '',
      eventDate: DateTime.parse(json['eventDate']),
      streetAddress: json['streetAddress'] ?? '',
      streetAddress2: json['streetAddress2'] ?? '',
      ticketSaleStart: DateTime.parse(json['ticketSaleStart']),
      preSaleStart: DateTime.parse(json['preSaleStart']),
      isFreeEvent: json['isFreeEvent'] ?? false,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'eventName': eventName,
      'image': image,
      'eventDate': eventDate.toIso8601String(),
      'streetAddress': streetAddress,
      'streetAddress2': streetAddress2,
      'ticketSaleStart': ticketSaleStart.toIso8601String(),
      'preSaleStart': preSaleStart.toIso8601String(),
      'isFreeEvent': isFreeEvent,
    };
  }
}
