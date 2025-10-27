import 'package:mainland/user/ticket/model/available_ticket_model.dart';
import 'package:mainland/user/ticket/model/ticket_picker_model.dart';
import 'package:mainland/user/ticket/repository/ticket_purchase_repository.dart';

class RealTicketPurchaseRepository implements TicketPurchaseRepository {
  @override
  Future<List<TicketPickerModel>> getTicketPurchaseState({
    TicketType? ticketType,
    required TicketOwnerType ticketOwnerType,
  }) {
    // TODO: implement getTicketPurchaseState
    throw UnimplementedError();
  }

  @override
  Future<List<AvailableTicketModel>> getAvailableTicket() {
    // TODO: implement getAvailableTicket
    throw UnimplementedError();
  }
 
}
