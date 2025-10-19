import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/user/ticket/cubit/ticket_purchase_state.dart';
import 'package:mainland/user/ticket/model/ticket_picker_model.dart';
import 'package:mainland/user/ticket/repository/ticket_purchase_repository.dart';

class TicketPurchaseCubit extends SafeCubit<TicketPurchaseState> {
  TicketPurchaseCubit() : super(const TicketPurchaseState());
  final repository = getIt<TicketPurchaseRepository>();

  Future<void> fetchTicketPurchase({String? filterTicketType}) async {
    final response = await repository.getTicketPurchaseState(filterTicketType: filterTicketType);
    emit(state.copyWith(tickets: response));
  }

  Future<void> onTicketSelction(TicketPickerModel ticketPickerModel) async {
    final List<TicketPickerModel> tickets = List.from(state.tickets);
    final index = tickets.indexWhere((element) => element.title == ticketPickerModel.title);
    if (index == -1) return;
    tickets[index] = ticketPickerModel;
    final double subTotal = tickets.fold(
      0,
      (previousValue, element) => previousValue + (element.count * element.price),
    );

    final double total = subTotal == 0 ? 0 : (subTotal + state.mainlandFee) - state.discount;
    emit(state.copyWith(subtotal: subTotal, total: total, tickets: tickets));
  }
}
