// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mainland/user/ticket/model/ticket_picker_model.dart';

class TicketPurchaseState extends Equatable {
  const TicketPurchaseState({
    this.total = 0,
    this.discount = 2,
    this.subtotal = 0,
    this.mainlandFee = 5,
    this.tickets = const [],
  });

  final double total;
  final double discount;
  final double subtotal;
  final double mainlandFee;
  final List<TicketPickerModel> tickets;

  TicketPurchaseState copyWith({
    double? total,
    double? discount,
    double? subtotal,
    double? mainlandFee,
    List<TicketPickerModel>? tickets,
  }) {
    return TicketPurchaseState(
      total: total ?? this.total,
      discount: discount ?? this.discount,
      subtotal: subtotal ?? this.subtotal,
      mainlandFee: mainlandFee ?? this.mainlandFee,
      tickets: tickets ?? this.tickets,
    );
  }

  @override
  List<Object> get props {
    return [total, discount, subtotal, mainlandFee, tickets];
  }
}
