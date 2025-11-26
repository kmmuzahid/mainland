import 'package:mainland/core/config/dependency/core_dependency.dart';
import 'package:mainland/core/config/dependency/mock_repository_dependency.dart';
import 'package:get_it/get_it.dart';
import 'package:mainland/core/config/dependency/real_repository_dependency.dart';

GetIt getIt = GetIt.instance;

class DependencyInjection {
  void dependencies() {
    CoreDependency.dependencies();

    //repositroy
    MockRepositoryDependency.dependencies();
    RealRepositoryDependency.dependencies();
  }
}
