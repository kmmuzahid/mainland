// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:mainland/user/ticket/model/available_ticket_model.dart';

import 'package:mainland/user/ticket/model/ticket_picker_model.dart';

class TicketPurchaseState extends Equatable {
  TicketPurchaseState({
    this.total = 0,
    this.discount = 2,
    this.subtotal = 0,
    this.mainlandFee = 5,
    this.tickets = const [],
    this.availableTickets = const [],
  });

  double total;
  double discount;
  double subtotal;
  double mainlandFee;
  List<TicketPickerModel> tickets;
  List<AvailableTicketModel> availableTickets;

  TicketPurchaseState copyWith({
    double? total,
    double? discount,
    double? subtotal,
    double? mainlandFee,
    List<TicketPickerModel>? tickets,
    List<AvailableTicketModel>? availableTickets,
  }) {
    return TicketPurchaseState(
      total: total ?? this.total,
      discount: discount ?? this.discount,
      subtotal: subtotal ?? this.subtotal,
      mainlandFee: mainlandFee ?? this.mainlandFee,
      tickets: tickets ?? this.tickets,
      availableTickets: availableTickets ?? this.availableTickets,
    );
  }

  @override
  List<Object> get props {
    return [total, discount, subtotal, mainlandFee, tickets, availableTickets];
  }
}
