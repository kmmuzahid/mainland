import 'package:mainland/core/utils/app_utils.dart';

enum TicketFilter { Live, Available, Sold, Expired, Upcoming, Used, UnderReview, Draft, Closed }

class TicketModel {
  final String? id;
  final String? eventName;
  final String? image;
  final DateTime? eventDate;
  final String? streetAddress;
  final String? streetAddress2;
  final DateTime? ticketSaleStart;
  final DateTime? preSaleStart;
  final bool? isFreeEvent;

  TicketModel({
    this.id,
    this.eventName,
    this.image,
    this.eventDate,
    this.streetAddress,
    this.streetAddress2,
    this.ticketSaleStart,
    this.preSaleStart,
    this.isFreeEvent,
  });

  // From JSON
  factory TicketModel.fromJson(Map<String, dynamic> json) { 
    return TicketModel(
      id: json['_id'] ?? '',
      eventName: json['eventName'] ?? '',
      image: json['image'] ?? '',
      eventDate: Utils.parseDate(json['eventDate']),
      streetAddress: json['streetAddress'] ?? '',
      streetAddress2: json['streetAddress2'] ?? '',
      ticketSaleStart: Utils.parseDate(json['ticketSaleStart']),
      preSaleStart: Utils.parseDate(json['preSaleStart']),
      isFreeEvent: json['isFreeEvent'] ?? false,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'eventName': eventName,
      'image': image,
      'eventDate': eventDate?.toIso8601String(),
      'streetAddress': streetAddress,
      'streetAddress2': streetAddress2,
      'ticketSaleStart': ticketSaleStart?.toIso8601String(),
      'preSaleStart': preSaleStart?.toIso8601String(),
      'isFreeEvent': isFreeEvent,
    };
  }
}
