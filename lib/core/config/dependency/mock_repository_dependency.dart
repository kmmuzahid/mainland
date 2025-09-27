import 'package:mainland/common/auth/repository/auth_repository.dart';
import 'package:mainland/common/auth/repository/mock_auth_repository.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/utils/log/app_log.dart';

class MockRepositoryDependency {
  static void dependencies() {
    getIt.registerLazySingleton<AuthRepository>(MockAuthRepository.new);

    AppLogger.debug('Mock repository dependency initalized', tag: 'dependency');
  }
}
