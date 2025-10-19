import 'package:mainland/core/utils/helpers/simulate_moc_repo.dart';
import 'package:mainland/user/ticket/repository/ticket_purchase_repository.dart';

import 'package:mainland/user/ticket/model/ticket_picker_model.dart';

class MockTicketPurchaseRepository extends TicketPurchaseRepository {
  @override
  Future<List<TicketPickerModel>> getTicketPurchaseState({String? filterTicketType}) async {
    await SimulateMocRepo();
    final username = filterTicketType != null ? 'KM MI' : null;
    return [
      TicketPickerModel(
        userName: username,
        title: filterTicketType ?? 'Standard',
        price: 200,
        limit: 10,
        count: 0,
      ),
      TicketPickerModel(
        userName: username,
        title: filterTicketType ?? 'Gold',
        price: 250,
        limit: 10,
        count: 0,
      ),
      TicketPickerModel(
        userName: username,
        title: filterTicketType ?? 'Premium',
        price: 350,
        limit: 10,
        count: 0,
      ),
      TicketPickerModel(
        userName: username,
        title: filterTicketType ?? 'Vip',
        price: 450,
        limit: 10,
        count: 0,
      ),
      TicketPickerModel(
        userName: username,
        title: filterTicketType ?? 'Free',
        price: 0,
        limit: 10,
        count: 0,
      ),
    ];
  }
}
