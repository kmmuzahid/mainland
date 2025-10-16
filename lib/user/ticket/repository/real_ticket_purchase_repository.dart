import 'package:mainland/user/ticket/model/ticket_picker_model.dart';
import 'package:mainland/user/ticket/repository/ticket_purchase_repository.dart';

class RealTicketPurchaseRepository implements TicketPurchaseRepository {
  @override
  Future<List<TicketPickerModel>> getTicketPurchaseState() {
    throw UnimplementedError();
  }
}
