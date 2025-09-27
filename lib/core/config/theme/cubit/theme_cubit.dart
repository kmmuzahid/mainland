import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/storage/storage_service.dart';
import 'package:mainland/core/config/theme/light_theme.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeData: lightTheme));
  final StorageService _service = getIt();
  Future<void> update() async {
    emit(ThemeState(themeData: lightTheme));
    AppLogger.debug('Theme has been changed', tag: 'ThemeCubit');
  }
}
