import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
import 'package:mainland/user/ticket/cubit/ticket_purchase_state.dart';
import 'package:mainland/user/ticket/model/ticket_picker_model.dart';
import 'package:mainland/user/ticket/repository/ticket_purchase_repository.dart';

class TicketPurchaseCubit extends SafeCubit<TicketPurchaseState> {
  TicketPurchaseCubit() : super(TicketPurchaseState());
  final repository = getIt<TicketPurchaseRepository>();

  Future<void> fetchTicketPurchase({
    TicketOwnerType? ticketOwnerType,
    TicketName? ticketType,
  }) async {
    final response = await repository.getTicketPurchaseState(
      ticketType: ticketType,
      ticketOwnerType: TicketOwnerType.attendee,
    );
    emit(state.copyWith(tickets: response));
  }

  Future<void> fetchAvailableTicket() async {
    final response = await repository.getAvailableTicket();
    emit(state.copyWith(availableTickets: response));
  }

  Future<void> onTicketSelection(TicketPickerModel ticketPickerModel) async {
    final List<TicketPickerModel> tickets = List.from(state.tickets);
    final index = tickets.indexWhere((element) => element.id == ticketPickerModel.id);

    if (index == -1) {
      // Add new ticket if not already present
      tickets.add(ticketPickerModel);
    } else {
      // Update existing ticket
      tickets[index] = ticketPickerModel;
    }

    final double subTotal = tickets.fold(
      0,
      (previousValue, element) => previousValue + (element.count * element.price),
    );

    final double total = subTotal == 0 ? 0 : (subTotal + state.mainlandFee) - state.discount;

    emit(state.copyWith(subtotal: subTotal, total: total, tickets: tickets));
  }
}
