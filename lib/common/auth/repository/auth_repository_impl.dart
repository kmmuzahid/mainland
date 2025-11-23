import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/auth/model/profile_model.dart';
import 'package:mainland/common/auth/model/user_login_info_model.dart';
import 'package:mainland/common/auth/model/sign_up_model.dart';
import 'package:mainland/common/auth/repository/auth_repository.dart';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';
import 'package:mainland/core/config/network/response_state.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/utils/helpers/simulate_moc_repo.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/gen/assets.gen.dart';

class AuthRepositoryImpl implements AuthRepository {
  final DioService _dioService = getIt();
  @override
  Future<ResponseState<UserLoginInfoModel?>> signIn({
    required String username,
    required String password,
    required Role role,
  }) async {
    final login = await _dioService.request<UserLoginInfoModel?>(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.signIn,
        jsonBody: {'email': username, 'password': password},
        method: RequestMethod.POST,
      ),
      responseBuilder: (data) => UserLoginInfoModel(
        accessToken: data['Token'],
        refreshToken: data['RefreshToken'],
        role: role,
      ),
    );
    return login;
  }

  @override
  Future<String> signInWithFacebook() async => '';

  @override
  Future<String> signInWithGoogle() async => '';

  @override
  Future<ResponseState<String>> changePassword({
    required String username,
    required String oldPassword,
    required String newPassword,
  }) async => ResponseState(data: '', isSuccess: true, statusCode: 201);

  @override
  Future<ResponseState<bool>> deleteAccount() async =>
      ResponseState(data: true, isSuccess: true, statusCode: 201);
  @override
  Future<ResponseState<ProfileModel?>> getCurrentUser() async {
    final response = await _dioService.request<ProfileModel>(
      input: RequestInput(endpoint: ApiEndPoint.instance.profile, method: RequestMethod.GET),
      responseBuilder: (data) => ProfileModel.fromJson(data),
    );
    return response;
  }

  @override
  Future<ResponseState<dynamic>> resetPassword({
    required String verificationToken,
    required String newPassword,
  }) async {
    final response = await _dioService.request<dynamic>(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.resetPassword,
        method: RequestMethod.POST,
        jsonBody: {
          'newPassword': newPassword,
          'confirmPassword': newPassword,
          'token': verificationToken,
        },
      ),
      showMessage: true,
      responseBuilder: (data) => data,
    );
    return response;
  }

  @override
  Future<ResponseState<dynamic>> sendOtp({required String username}) async {
    final response = await _dioService.request<dynamic>(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.resendOtp,
        method: RequestMethod.POST,
        jsonBody: {'email': username},
      ),
      showMessage: true,
      responseBuilder: (data) => data,
    );
    return response;
  }

  @override
  Future<ResponseState<bool>> signOut() async =>
      ResponseState(data: true, isSuccess: true, statusCode: 201);

  @override
  Future<ResponseState<dynamic>> signUp({required SignUpModel signUpModel}) async {
    final response = await _dioService.request<dynamic>(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.signUp,
        method: RequestMethod.POST,
        jsonBody: {
          'name': signUpModel.fullName,
          'personalInfo': {
            'phone': signUpModel.phone,
            'dateOfBirth': signUpModel.dateOfBirth?.millisecondsSinceEpoch,
          },
          'address': {'city': signUpModel.city, 'street': signUpModel.state},
          'email': signUpModel.email,
          'password': signUpModel.password,
          'role': signUpModel.registrationType == 'organizer'
              ? signUpModel.registrationType.toUpperCase()
              : 'USER',
        },
      ),
      responseBuilder: (data) => data,
    );
    return response;
  }

  @override
  Future<ResponseState<dynamic>> verifyOtp({
    required String verificationId,
    required String otp,
  }) async {
    final response = await _dioService.request<dynamic>(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.verifyEmail,
        method: RequestMethod.POST,
        jsonBody: {'email': verificationId, 'oneTimeCode': int.parse(otp)},
      ),
      responseBuilder: (data) => data,
    );
    return response;
  }

  @override
  Future<ResponseState<String?>> getPrivacyPolicy() async {
    return _dioService.request<String>(
      input: RequestInput(endpoint: ApiEndPoint.instance.privacyPolicy, method: RequestMethod.GET),
      responseBuilder: (data) => data['privacyPolicy'],
    );
  }

  @override
  Future<ResponseState<String?>> getTermsAndConditions() {
    return _dioService.request<String>(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.termsAndConditions,
        method: RequestMethod.GET,
      ),
      responseBuilder: (data) => data['termsAdnCondition'],
    );
  }
}
