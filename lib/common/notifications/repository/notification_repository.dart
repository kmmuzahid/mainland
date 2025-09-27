import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mainland/core/utils/helpers/simulate_moc_repo.dart';

import '../model/notification_model.dart';

class NotificationRepository {
  Future<List<RemoteMessage>> fetch({required int page}) async {
    await SimulateMocRepo();
    return [
      ...generateMockList(
        builder: (index) => RemoteMessage(
          messageId: index.toString(),
          messageType: NotificationType.others.name,
          sentTime: DateTime.now(),
          notification: RemoteNotification(
            title: 'Dummy Notificaiton $index',
            body: 'Its a simple notification to test UI design.',
          ),
        ),
      ),
      ...generateMockList(
        builder: (index) => RemoteMessage(
          messageId: index.toString(),
          messageType: NotificationType.others.name,
          sentTime: DateTime.now(),
          notification: RemoteNotification(
            title: 'Dummy Notificaiton $index',
            body: 'Its a simple notification to test UI design.',
          ),
        ),
      ),
    ];
  }
}
