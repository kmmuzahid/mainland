import 'package:mainland/common/tickets/widgets/ticket_filter_widget.dart';
import 'package:mainland/core/config/network/response_state.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
import 'package:mainland/user/ticket/model/available_ticket_model.dart';
import 'package:mainland/user/ticket/model/ticket_picker_model.dart';
import 'package:mainland/user/ticket/screen/ticket_checkout_screen.dart';

abstract class TicketPurchaseRepository {
  Future<List<TicketPickerModel>> getTicketPurchaseState({
    required TicketOwnerType ticketOwnerType,
    TicketName? ticketType,
    required String id,
  });

  Future<ResponseState<List<AvailableTicketModel>?>> getAvailableTicket({required String eventId});

  Future<ResponseState<int?>> getPromoCodePercnetage({
    required String promoCode,
    required String id,
  });

  Future<ResponseState<dynamic>> checkout({
    required String id,
    required String fullName,
    required String email,
    required String phoneNumber,
    required TicketOwnerType ticketOwnerType,
    required List<TicketPickerModel> tickets,
  });
}
