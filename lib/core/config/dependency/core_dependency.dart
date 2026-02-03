/*
 * @Author: Km Muzahid
 * @Date: 2025-11-19 10:02:29
 * @Email: km.muzahid@gmail.com
 */
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/notifications/repository/notification_repository.dart';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/storage/storage_service.dart';
import 'package:mainland/core/utils/log/app_log.dart';

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
      return DioService.init(
        config: DioServiceConfig(
          enableDebugLogs: true,
          baseUrl: ApiEndPoint.instance.baseUrl,
          refreshTokenEndpoint: ApiEndPoint.instance.refreshToken,
          onLogout: () {
            appRouter.navigatorKey.currentState?.context.read<AuthCubit>().clear();
          },
        ),
        tokenProvider: TokenProvider(
          accessToken: () async {
            return appRouter.navigatorKey.currentState?.context
                    .read<AuthCubit>()
                    .state
                    .userLoginInfoModel
                    .accessToken ??
                '';
          },
          refreshToken: () async {
            return appRouter.navigatorKey.currentState?.context
                    .read<AuthCubit>()
                    .state
                    .userLoginInfoModel
                    .refreshToken ??
                '';
          },
          updateTokens: (data) async {
            return appRouter.navigatorKey.currentState?.context.read<AuthCubit>().updateToken(
              accessToken: data['accessToken']?.toString() ?? '',
              refreshToken: data['refreshToken']?.toString() ?? '',
            );
          },
        ),
      );
    });
    getIt.registerLazySingleton<NotificationRepository>(NotificationRepository.new);

    AppLogger.debug('Core dependency initalized', tag: 'dependency');
  }
}
