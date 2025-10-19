import 'package:mainland/user/ticket/model/ticket_picker_model.dart';

abstract class TicketPurchaseRepository {
  Future<List<TicketPickerModel>> getTicketPurchaseState({String? filterTicketType});
}
