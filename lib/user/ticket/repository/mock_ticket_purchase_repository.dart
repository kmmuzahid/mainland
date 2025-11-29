import 'package:mainland/core/utils/helpers/simulate_moc_repo.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
import 'package:mainland/user/ticket/model/available_ticket_model.dart';
import 'package:mainland/user/ticket/repository/ticket_purchase_repository.dart';

import 'package:mainland/user/ticket/model/ticket_picker_model.dart';

class MockTicketPurchaseRepository extends TicketPurchaseRepository {

  //filter type is is it 
  @override
  Future<List<TicketPickerModel>> getTicketPurchaseState({
    TicketName? ticketType,

    required TicketOwnerType ticketOwnerType,
  }) async {
 
    return [
      TicketPickerModel(
        id: '1',
        userName: ticketType != null ? 'KM MI' : null,
        title: ticketType?.name ?? 'Standard',
        price: 200,
        limit: 10,
        count: 0,
      ),
      TicketPickerModel(
        id: '2',
        userName: ticketType != null ? 'Gbenga' : null,
        title: ticketType?.name ?? 'Gold',
        price: 250,
        limit: 10,
        count: 0,
      ),
      TicketPickerModel(
        id: '3',
        userName: ticketType != null ? 'Gebenga 1' : null,
        title: ticketType?.name ?? 'Premium',
        price: 350,
        limit: 10,
        count: 0,
      ),
      TicketPickerModel(
        id: '4',
        userName: ticketType != null ? 'Gebenga 2' : null,
        title: ticketType?.name ?? 'Vip',
        price: 450,
        limit: 10,
        count: 0,
      ),
      if (ticketOwnerType == TicketOwnerType.organizer)
      TicketPickerModel(
          id: '5',
          userName: ticketType != null ? 'Gebenga 3' : null,
          title: ticketType?.name ?? 'Free',
          price: 0,
        limit: 10,
        count: 0,
      ),
    ];
  }

  @override
  Future<List<AvailableTicketModel>> getAvailableTicket() async {
    return [
      AvailableTicketModel(ticketType: TicketName.Premium, availableUnits: 5),
      AvailableTicketModel(ticketType: TicketName.VIP, availableUnits: 6),
      AvailableTicketModel(ticketType: TicketName.Standard, availableUnits: 7),
      AvailableTicketModel(ticketType: TicketName.Other, availableUnits: 8), 
    ];
  } 
}
