import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
import 'package:mainland/user/ticket/model/ticket_picker_model.dart';

class AvailableTicketModel {
  final TicketName ticketType;
  final int availableUnits;

  AvailableTicketModel({required this.ticketType, required this.availableUnits});
}
