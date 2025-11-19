import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mainland/common/auth/model/sign_up_model.dart';
import 'package:mainland/common/auth/model/user_login_info_model.dart';
import 'package:mainland/common/auth/repository/auth_repository.dart';
import 'package:mainland/common/auth/widgets/otp_verify_widget.dart';
import 'package:mainland/common/auth/widgets/terms_and_conditions.dart';
import 'package:mainland/core/component/other_widgets/common_dialog.dart';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/config/storage/storage_service.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/main.dart';

import 'auth_state.dart';

class AuthCubit extends SafeCubit<AuthState> {
  AuthCubit() : super(const AuthState());
  final AuthRepository _repository = getIt();
  final StorageService _storageService = getIt();
  final DioService _dioService = getIt();
  final String _loginInfo = 'login_info_key';
  Role _role = Role.ATTENDEE;

  void updateTermsConditonsStatus(bool value) async {
    emit(state.copyWith(isTermsAndConditonsAccepted: value));
  }

  void acceptTermsAndConditions() async {
    if (state.userLoginInfoModel.accessToken.isEmpty) {
      final login = await _dioService.request<UserLoginInfoModel>(
        input: RequestInput(
          endpoint: ApiEndPoint.instance.signIn,
          jsonBody: {'email': state.signUpModel.email, 'password': state.signUpModel.password},
          method: RequestMethod.POST,
        ),
        responseBuilder: (data) => state.userLoginInfoModel.copyWith(
          accessToken: data['Token'],
          refreshToken: data['RefreshToken'],
          role: _role,
          username: state.signUpModel.email,
          name: state.signUpModel.fullName,
        ),
      );
      if (login.data != null) {
        await _saveUserInfo(login.data!);
      }
    }

    final responce = await _dioService.request<dynamic>(
      input: RequestInput(endpoint: ApiEndPoint.instance.profile, method: RequestMethod.PATCH),
      responseBuilder: (data) => data,
    );

    if (responce.statusCode == 200) {
      appRouter.replaceAll([const SplashRoute()]);
    } else {
      showSnackBar(responce.message ?? '', type: SnackBarType.error);
    }
  }

  void onChangeUserRole(Role role) {
    AppLogger.debug(role.name, tag: 'AuthCubit');
    _role = role;
  }

  Future<void> _saveUserInfo(UserLoginInfoModel userInfo) async {
    emit(state.copyWith(userLoginInfoModel: userInfo));
    _storageService.write(_loginInfo, userInfo.toJson());
  }

  Future<void> onChangeSignUpModel(SignUpModel? signUpModel) async {
    if (signUpModel == null) return;
    emit(state.copyWith(signUpModel: signUpModel));
  }

  Future<void> init() async {
    AppLogger.debug('init auth cubit', tag: 'AuthCubit');
    try {
      final String? data = await _storageService.read(_loginInfo);
      AppLogger.debug(data ?? '', tag: 'Storage Service');
      if (data != null) {
        _saveUserInfo(UserLoginInfoModel.fromJson(data));
      } else {
        emit(const AuthState());
      }
      if (state.userLoginInfoModel.accessToken.isNotEmpty) {
        appRouter.replaceAll([const HomeRoute()]);
      }
    } catch (e) {
      AppLogger.error(e.toString(), tag: 'Storage Service');
      AppLogger.error(
        'Now Deleting everything from secure storage to resume, Restart The app',
        tag: 'Storage Service',
      );
      _storageService.deleteAll();
    }
  }

  Future<void> signIn(String username, String password) async {
    if (state.isLoading) return;
    emit(const AuthState(isLoading: true));
    AppLogger.debug(_role.name, tag: 'AuthCubit');
    final responce = await _repository.signIn(username: username, password: password, role: _role);
    emit(state.copyWith(isLoading: false));
    if (responce.statusCode == 200) {
      AppLogger.debug(responce.data.toString(), tag: 'AuthCubit');
      await _saveUserInfo(responce.data);
      appRouter.replaceAll([const HomeRoute()]);
    } else {
      showSnackBar(responce.message ?? '', type: SnackBarType.error);
    }
  }

  Future<void> signUp(SignUpModel signUpModel) async {
    emit(state.copyWith(isLoading: true));
    final response = await _repository.signUp(signUpModel: signUpModel);
    emit(state.copyWith(isLoading: false));
    if (response.statusCode == 200) {
      commonDialog(
        context: appRouter.navigatorKey.currentState!.context,
        child: OtpVerifyWidget(
          email: state.signUpModel.email,
          onSuccess: () {
            appRouter.pop();
            TermsAndConditions.instance.show(this);
          },
        ),
      );
    } else {
      showSnackBar(response.message ?? '', type: SnackBarType.error);
    }
  }

  Future<void> signInWithGoogle() async {}

  Future<void> signInWithFacebook() async {}

  Future<void> getCurrentUser() async {
    final response = await _repository.getCurrentUser(username: state.userLoginInfoModel.username);
    if (response.data.accessToken.isNotEmpty) {
      await _saveUserInfo(response.data);
    } else {
      await _storageService.deleteAll();
      appRouter.replaceAll([
        SignInRoute(ctrUsername: TextEditingController(), ctrPassword: TextEditingController()),
      ]);
    }
  }

  Future<void> forgetPassword(String username, String otp) async {}

  Future<void> changePassword(String newPassword) async {
    appRouter.replace(
      SignInRoute(ctrUsername: TextEditingController(), ctrPassword: TextEditingController()),
    );
  }

  Future<void> updateToken({required String? accessToken, required String? refreshToken}) async {
    _saveUserInfo(
      state.userLoginInfoModel.copyWith(accessToken: accessToken, refreshToken: refreshToken),
    );
  }

  Future<void> logout() async {
    _role = Role.ATTENDEE;
    await _repository.signOut();
    await _storageService.deleteAll();
    appRouter.replaceAll([
      SignInRoute(ctrUsername: TextEditingController(), ctrPassword: TextEditingController()),
    ]);
    emit(const AuthState());
  }

  Future<void> calculateAge(DateTime? date) async {
    if (date == null) {
      emit(state.copyWith(age: 0));
      return;
    }

    final now = DateTime.now();
    int age = now.year - date.year;
    if (now.month < date.month || (now.month == date.month && now.day < date.day)) {
      age--;
    }
    if (age < 0) age = 0; // Ensure age is not negative
    emit(state.copyWith(age: age));
  }
}
