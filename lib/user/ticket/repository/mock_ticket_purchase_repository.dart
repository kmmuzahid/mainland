import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';
import 'package:mainland/core/config/network/response_state.dart';
import 'package:mainland/organizer/createTicket/model/create_event_model.dart';
import 'package:mainland/user/ticket/model/available_ticket_model.dart';
import 'package:mainland/user/ticket/repository/ticket_purchase_repository.dart';

import 'package:mainland/user/ticket/model/ticket_picker_model.dart';

class MockTicketPurchaseRepository extends TicketPurchaseRepository {
  final DioService _dioService = getIt();

  //filter type is is it
  @override
  Future<List<TicketPickerModel>> getTicketPurchaseState({
    TicketName? ticketType,

    required String id,
    required TicketOwnerType ticketOwnerType,
  }) async {
    String path = ApiEndPoint.instance.getAvailableTicketFromUser(id: id);
    if (ticketOwnerType == TicketOwnerType.organizer) {
      path = ApiEndPoint.instance.getAvailableTicketFromOrg(id: id);
    }

    final result = await _dioService.request<List<TicketPickerModel>>(
      input: RequestInput(endpoint: path, method: RequestMethod.GET),
      responseBuilder: (response) => (response['tickets'] as List<dynamic>).map((e) {
        final info = e;
        return TicketPickerModel(
          id: '${DateTime.now().microsecondsSinceEpoch}_${info['price'] ?? 0}',
          userName: ticketType != null && info['ownerName'] != null ? info['ownerName'] : '',
          sellerId: ticketType != null && info['sellerId'] != null ? info['sellerId'] : '',
          type: info['type'] ?? '',
          price: info['price']?.toDouble() ?? 0,
          limit: info['availableUnits']?.toInt() ?? 0,
          count: 0,
        );
      }).toList(),
    );

    return result.data ?? [];
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

  @override
  Future<ResponseState<int?>> getPromoCodePercnetage({
    required String promoCode,
    required String id,
  }) async {
    final result = await _dioService.request<int>(
      showMessage: true,
      input: RequestInput(
        endpoint: ApiEndPoint.instance.checkPromoCode(id),
        method: RequestMethod.GET,
        jsonBody: {'code': promoCode},
      ),
      responseBuilder: (response) => response['percentage']?.toInt() ?? 0,
    );
    return result;
  }

  @override
  Future<ResponseState<dynamic>> checkout({
    required String id,
    required String fullName,
    required String email,
    required String phoneNumber,
    required TicketOwnerType ticketOwnerType,
    required List<TicketPickerModel> tickets,
  }) async {
    String path = ApiEndPoint.instance.purchaseFromUser(id: id);
    if (ticketOwnerType == TicketOwnerType.organizer)
      path = ApiEndPoint.instance.purchaseFromOrganizer(id: id);

    final result = await _dioService.request<dynamic>(
      showMessage: true,
      input: RequestInput(
        endpoint: path,
        method: RequestMethod.POST,
        jsonBody: {
          'fullName': fullName,
          'email': email,
          'phone': phoneNumber,
          'tickets': tickets
              .map(
                (e) => {
                  'ticketType': e.type,
                  'quantity': e.count,
                  if (ticketOwnerType == TicketOwnerType.attendee) 'amount': e.price,
                  if (ticketOwnerType == TicketOwnerType.attendee) 'sellerId': e.sellerId,
                },
              )
              .toList(),
        },
      ),
      responseBuilder: (response) => response['percentage']?.toInt() ?? 0,
    );
    return result;
  }
}
