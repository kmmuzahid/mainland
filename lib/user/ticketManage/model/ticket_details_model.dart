// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mainland/organizer/createTicket/model/create_event_model.dart';

class TicketDetailsModel {
  //enum
  final TicketName ticketType;
  final int totalPurchaseTicket;
  final double totalPurchaseAmount;
  const TicketDetailsModel({
    required this.ticketType,
    required this.totalPurchaseTicket,
    required this.totalPurchaseAmount,
  });

  TicketDetailsModel copyWith({
    TicketName? ticketType,
    int? totalPurchaseTicket,
    double? totalPurchaseAmount,
  }) {
    return TicketDetailsModel(
      ticketType: ticketType ?? this.ticketType,
      totalPurchaseTicket: totalPurchaseTicket ?? this.totalPurchaseTicket,
      totalPurchaseAmount: totalPurchaseAmount ?? this.totalPurchaseAmount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ticketType': ticketType.index,
      'totalPurchaseTicket': totalPurchaseTicket,
      'totalPurchaseAmount': totalPurchaseAmount,
    };
  }

  factory TicketDetailsModel.fromMap(Map<String, dynamic> map) {
    return TicketDetailsModel(
      ticketType: TicketName.values.byName(map['ticketType']),
      totalPurchaseTicket: map['totalPurchaseTicket']?.toInt() ?? 0,
      totalPurchaseAmount: map['totalPurchaseAmount']?.toDouble() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketDetailsModel.fromJson(String source) =>
      TicketDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TicketDetailsModel(ticketType: $ticketType, totalPurchaseTicket: $totalPurchaseTicket, totalPurchaseAmount: $totalPurchaseAmount)';

  @override
  bool operator ==(covariant TicketDetailsModel other) {
    if (identical(this, other)) return true;

    return other.ticketType == ticketType &&
        other.totalPurchaseTicket == totalPurchaseTicket &&
        other.totalPurchaseAmount == totalPurchaseAmount;
  }

  @override
  int get hashCode =>
      ticketType.hashCode ^ totalPurchaseTicket.hashCode ^ totalPurchaseAmount.hashCode;
}
