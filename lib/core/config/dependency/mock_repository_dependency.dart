import 'package:mainland/common/auth/repository/auth_repository.dart';
import 'package:mainland/common/auth/repository/mock_auth_repository.dart';
import 'package:mainland/common/chat/repository/chat_repository.dart';
import 'package:mainland/common/chat/repository/mock_chat_repository.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/user/ticket/repository/mock_ticket_purchase_repository.dart';
import 'package:mainland/user/ticket/repository/ticket_purchase_repository.dart';

class MockRepositoryDependency {
  static void dependencies() {
    getIt.registerLazySingleton<ChatRepository>(MockChatRepository.new);
    getIt.registerLazySingleton<AuthRepository>(MockAuthRepository.new);
    getIt.registerLazySingleton<TicketPurchaseRepository>(MockTicketPurchaseRepository.new);

    AppLogger.debug('Mock repository dependency initalized', tag: 'dependency');
  }
}
