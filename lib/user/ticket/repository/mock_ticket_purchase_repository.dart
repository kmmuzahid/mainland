import 'package:mainland/core/utils/helpers/simulate_moc_repo.dart';
import 'package:mainland/user/ticket/repository/ticket_purchase_repository.dart';

import 'package:mainland/user/ticket/model/ticket_picker_model.dart';

class MockTicketPurchaseRepository extends TicketPurchaseRepository {
  @override
  Future<List<TicketPickerModel>> getTicketPurchaseState() async {
    await SimulateMocRepo();
    return [
      TicketPickerModel(title: 'Standard', price: 200, limit: 10, count: 0),
      TicketPickerModel(title: 'Gold', price: 250, limit: 10, count: 0),
      TicketPickerModel(title: 'Premium', price: 350, limit: 10, count: 0),
      TicketPickerModel(title: 'Vip', price: 450, limit: 10, count: 0),
      TicketPickerModel(title: 'Free', price: 0, limit: 10, count: 0),
    ];
  }
}
