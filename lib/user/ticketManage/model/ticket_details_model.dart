// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mainland/organizer/createTicket/model/create_event_model.dart';

class TicketDetailsModel {
  //enum
  final TicketName ticketType;
  final int unit;
  final double sellPrice;

  const TicketDetailsModel({
    required this.ticketType,
    required this.unit, required this.sellPrice,
  });

  TicketDetailsModel copyWith({
    TicketName? ticketType,
    int? totalPurchaseTicket,
    double? totalPurchaseAmount,
  }) {
    return TicketDetailsModel(
      ticketType: ticketType ?? this.ticketType,
      unit: totalPurchaseTicket ?? this.unit,
      sellPrice: totalPurchaseAmount ?? this.sellPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ticketType': ticketType.index,
      'totalPurchaseTicket': unit,
      'totalPurchaseAmount': sellPrice,
    };
  }

  factory TicketDetailsModel.fromMap(Map<String, dynamic> map) {
    return TicketDetailsModel(
      ticketType: TicketName.values.byName(map['ticketType']),
      unit: map['unit']?.toInt() ?? 0,
      sellPrice: map['sellPrice']?.toDouble() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketDetailsModel.fromJson(String source) =>
      TicketDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TicketDetailsModel(ticketType: $ticketType, totalPurchaseTicket: $unit, totalPurchaseAmount: $sellPrice)';

  @override
  bool operator ==(covariant TicketDetailsModel other) {
    if (identical(this, other)) return true;

    return other.ticketType == ticketType &&
        other.unit == unit && other.sellPrice == sellPrice;
  }

  @override
  int get hashCode =>
      ticketType.hashCode ^ unit.hashCode ^ sellPrice.hashCode;
}
