import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/main.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
import 'package:mainland/user/ticket/cubit/ticket_purchase_state.dart';
import 'package:mainland/user/ticket/model/ticket_picker_model.dart';
import 'package:mainland/user/ticket/repository/ticket_purchase_repository.dart';

class TicketPurchaseCubit extends SafeCubit<TicketPurchaseState> {
  TicketPurchaseCubit() : super(const TicketPurchaseState());
  final repository = getIt<TicketPurchaseRepository>();

  Future<void> fetchTicketPurchase({
    TicketOwnerType? ticketOwnerType,
    TicketName? ticketType,
    required String id,
  }) async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final authCubit = appRouter.navigatorKey.currentState?.context.read<AuthCubit>();
    final response = await repository.getTicketPurchaseState(
      ticketType: ticketType,
      ticketOwnerType: ticketOwnerType ?? TicketOwnerType.attendee,
      id: id,
    );
    emit(
      state.copyWith(
        isLoading: false,
        tickets: response,
        percentage: authCubit?.state.profileModel?.mainlandFee ?? 0,
        eventId: id,
      ),
    );
  }

  ///attendiee ticket summery
  Future<void> fetchAvailableTicketSummery() async {
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
    
    final discount = subTotal * (state.promoPercentage > 0 ? (state.promoPercentage / 100) : 0);
    final mainlandFee =
        (subTotal - discount) * (state.percentage > 0 ? (state.percentage / 100) : 0);

    final double total = subTotal == 0 ? 0 : (subTotal + mainlandFee) - discount;

    emit(
      state.copyWith(
        subtotal: subTotal,
        discount: discount,
        total: total,
        tickets: tickets,
        mainlandFee: mainlandFee,
      ),
    );
  }

  Future<void> onChangeState(TicketPurchaseState ticketState) async {
    emit(ticketState);
  }

  Future<void> fetchPromo() async {
    if (state.promoCode.isEmpty) return;
    final response = await repository.getPromoCodePercnetage(
      promoCode: state.promoCode,
      id: state.eventId,
    );

    if (response.data != null && response.data! > 0) {
      final List<TicketPickerModel> tickets = List.from(state.tickets);

      final double subTotal = tickets.fold(
        0,
        (previousValue, element) => previousValue + (element.count * element.price),
      );
      final discount = subTotal * (response.data! > 0 ? (response.data! / 100) : 0);

      final mainlandFee =
          (subTotal - discount) * (state.percentage > 0 ? (state.percentage / 100) : 0);

      final double total = subTotal == 0 ? 0 : (subTotal + mainlandFee) - discount;

      emit(
        state.copyWith(
          subtotal: subTotal,
          total: total,
          tickets: tickets,
          mainlandFee: mainlandFee,
          promoPercentage: response.data,
          discount: discount,
        ),
      );
    }
  }

  Future<void> checkout(TicketOwnerType ticketOwnerType) async {
    if (state.isCheckedOut) return;
    emit(state.copyWith(isCheckedOut: true));
    final response = await repository.checkout(
      id: state.eventId,
      fullName: state.userName,
      email: state.email,
      phoneNumber: state.phoneNumber,
      ticketOwnerType: ticketOwnerType,
      tickets: state.tickets,
    );
    emit(state.copyWith(isCheckedOut: false));
    if (response.isSuccess && (response.data as String).isNotEmpty) {
      final String url = response.data;
      appRouter.push(
        PaymentWebView(
          checkoutUrl: url,
          onCancel: () {
            showSnackBar('Payment canceled.', type: SnackBarType.warning);
          },
          onSuccess: () {
            showSnackBar('Ticket purchase successful', type: SnackBarType.success);
            appRouter.popUntilRouteWithName(EventDetailsRoute.name);
          },
        ),
      );
    }
    //  appRouter.popUntilRouteWithName(EventDetailsRoute.name);
  }
}
