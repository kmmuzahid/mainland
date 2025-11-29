import 'package:mainland/common/tickets/widgets/ticket_filter_widget.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
import 'package:mainland/user/ticket/model/available_ticket_model.dart';
import 'package:mainland/user/ticket/model/ticket_picker_model.dart';
import 'package:mainland/user/ticket/screen/ticket_checkout_screen.dart';

abstract class TicketPurchaseRepository {
  Future<List<TicketPickerModel>> getTicketPurchaseState({
    required TicketOwnerType ticketOwnerType,
    TicketName? ticketType,
  });

  Future<List<AvailableTicketModel>> getAvailableTicket();
}
