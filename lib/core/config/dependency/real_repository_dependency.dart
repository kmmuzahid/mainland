import 'package:mainland/common/auth/repository/auth_repository.dart';
import 'package:mainland/common/auth/repository/auth_repository_impl.dart'; 
import 'package:mainland/common/chat/repository/chat_repository.dart';
import 'package:mainland/common/chat/repository/real_chat_repository.dart';
import 'package:mainland/common/event/repository/event_details_repository.dart';
import 'package:mainland/common/home/repository/home_repository.dart';
import 'package:mainland/common/home/repository/real_home_repository.dart';
import 'package:mainland/common/tickets/repository/ticket_repository.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/organizer/createTicket/repository/create_ticket_repository.dart';
 

class RealRepositoryDependency {
  static void dependencies() {
    
    // getIt.registerLazySingleton<ChatRepository>(RealChatRepository.new); 
    // getIt.registerLazySingleton<TicketPurchaseRepository>(RealTicketPurchaseRepository.new);
    
    getIt.registerLazySingleton<CreateTicketRepository>(CreateTicketRepository.new);
    getIt.registerLazySingleton<HomeRepository>(RealHomeRepository.new);
    getIt.registerLazySingleton<EventDetailsRepository>(EventDetailsRepository.new);

    getIt.registerLazySingleton<AuthRepository>(AuthRepositoryImpl.new);
    getIt.registerLazySingleton<TicketRepository>(TicketRepository.new);
    AppLogger.debug('Real repository dependency initalized', tag: 'dependency');
  }
}
