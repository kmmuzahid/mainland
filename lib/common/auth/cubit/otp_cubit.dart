import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mainland/common/auth/repository/auth_repository.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/main.dart';

import 'otp_state.dart';

class OtpCubit extends SafeCubit<OtpState> {
  OtpCubit() : super(const OtpState());
  final AuthRepository _repository = getIt();
  Timer? _timer;

  Future<void> resetState() async {
    emit(const OtpState());
  }

  void changeState(OtpState state) {
    emit(state);
  }

  Future<void> sendOtp(String username) async {
    if (_timer?.isActive == true || state.isLoading) {
      showSnackBar(
        '${AppString.resendCodeIn} ${state.count} ${AppString.seconds}',
        type: SnackBarType.warning,
      );
      return;
    }
    emit(OtpState(isLoading: true, username: username));
    final response = await _repository.sendOtp(username: username);
    if (response.data.isEmpty) {
      emit(const OtpState());
      return;
    }
    emit(state.copyWith(verificationId: response.data, isLoading: false));
    _startTimer();
  }

  Future<void> verifyOtp({required String otp, required Function onSuccess}) async {
    if (state.isLoading || state.verificationId.isEmpty) return;
    final isVerified = await _repository.verifyOtp(verificationId: state.verificationId, otp: otp);
    emit(state.copyWith(isVerified: isVerified.data));
    onSuccess(); // successfully verified
  }

  void _startTimer() {
    emit(state.copyWith(count: state.maxCount));
    _timer = null;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(state.copyWith(count: state.count - 1));
      if (state.count == 0) {
        _timer?.cancel();
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
