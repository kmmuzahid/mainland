import 'package:mainland/user/ticket/model/ticket_picker_model.dart';

class AvailableTicketModel {
  final TicketType ticketType;
  final int availableUnits;

  AvailableTicketModel({required this.ticketType, required this.availableUnits});
}
