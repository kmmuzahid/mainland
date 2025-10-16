import 'package:mainland/common/auth/repository/auth_repository.dart';
import 'package:mainland/common/auth/repository/real_auth_repository.dart';
import 'package:mainland/common/chat/repository/chat_repository.dart';
import 'package:mainland/common/chat/repository/real_chat_repository.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/user/ticket/repository/real_ticket_purchase_repository.dart';
import 'package:mainland/user/ticket/repository/ticket_purchase_repository.dart';

class RealRepositoryDependency {
  static void dependencies() {
    getIt.registerLazySingleton<ChatRepository>(RealChatRepository.new);
    getIt.registerLazySingleton<AuthRepository>(RealAuthRepository.new);
    getIt.registerLazySingleton<TicketPurchaseRepository>(RealTicketPurchaseRepository.new);
    AppLogger.debug('Real repository dependency initalized', tag: 'dependency');
  }
}
