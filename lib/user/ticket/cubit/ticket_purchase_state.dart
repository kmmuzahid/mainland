// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:mainland/user/ticket/model/available_ticket_model.dart';

import 'package:mainland/user/ticket/model/ticket_picker_model.dart';

class TicketPurchaseState extends Equatable {
  const TicketPurchaseState({
    this.total = 0,
    this.discount = 0,
    this.subtotal = 0,
    this.mainlandFee = 0,
    this.isLoading = false,
    this.percentage = 0,
    this.tickets = const [],
    this.availableTickets = const [],
    this.promoCode = '',
    this.promoPercentage = 0,
    this.userName = '',
    this.email = '',
    this.phoneNumber = '',
    this.eventId = '',
    this.isCheckedOut = false,
  });

  final bool isCheckedOut;

  final double total;
  final double discount;
  final double subtotal;
  final double mainlandFee;
  final bool isLoading;
  final int percentage;
  final List<TicketPickerModel> tickets;
  final List<AvailableTicketModel> availableTickets;
  final String promoCode;
  final int promoPercentage;
  final String userName;
  final String email;
  final String phoneNumber;
  final String eventId;

  TicketPurchaseState copyWith({
    double? total,
    double? discount,
    double? subtotal,
    double? mainlandFee,
    int? percentage,
    List<TicketPickerModel>? tickets,
    List<AvailableTicketModel>? availableTickets,
    bool? isLoading,
    String? promoCode,
    int? promoPercentage,
    String? userName,
    String? email,
    String? phoneNumber,
    String? eventId,
    bool? isCheckedOut,
  }) {
    return TicketPurchaseState(
      total: total ?? this.total,
      discount: discount ?? this.discount,
      subtotal: subtotal ?? this.subtotal,
      mainlandFee: mainlandFee ?? this.mainlandFee,
      percentage: percentage ?? this.percentage,
      tickets: tickets ?? this.tickets,
      availableTickets: availableTickets ?? this.availableTickets,
      isLoading: isLoading ?? this.isLoading,
      promoCode: promoCode ?? this.promoCode,
      promoPercentage: promoPercentage ?? this.promoPercentage,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      eventId: eventId ?? this.eventId,
      isCheckedOut: isCheckedOut ?? this.isCheckedOut,
    );
  }

  @override
  List<Object> get props {
    return [
      total,
      discount,
      subtotal,
      mainlandFee,
      percentage,
      tickets,
      availableTickets,
      isLoading,
      promoCode,
      promoPercentage,
      userName,
      email,
      phoneNumber,
      eventId,
      isCheckedOut,
    ];
  }
}
