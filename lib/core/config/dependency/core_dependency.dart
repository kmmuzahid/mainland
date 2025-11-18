import 'package:flutter/material.dart';
import 'package:mainland/common/chat/repository/chat_repository.dart';
import 'package:mainland/common/notifications/repository/notification_repository.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/config/storage/storage_service.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:get_it/get_it.dart';

import 'dependency_injection.dart';

class CoreDependency {
  static void dependencies() {
    // Step 1: Register and wait for StorageService first
    // Register StorageService (lazy singleton with init)
    // Register StorageService as eager singleton
    getIt.registerSingletonAsync<StorageService>(() async {
      final storageService = StorageService.instance;
      return storageService;
    });

    // Register DioService as eager singleton, depending on StorageService
    getIt.registerSingletonAsync<DioService>(() async {
      // Ensure StorageService is ready before creating DioService
      await getIt.isReady<StorageService>();

      return DioService.create(
        onLogout: () {
          appRouter.push(
            SignInRoute(ctrUsername: TextEditingController(), ctrPassword: TextEditingController()),
          );
        },
      );
    });
    getIt.registerLazySingleton<NotificationRepository>(NotificationRepository.new);

    AppLogger.debug('Core dependency initalized', tag: 'dependency');
  }
}
