import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/auth/model/user_login_info_model.dart';
import 'package:mainland/common/auth/model/sign_up_model.dart';
import 'package:mainland/common/auth/repository/auth_repository.dart';
import 'package:mainland/core/config/network/response_state.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/helpers/simulate_moc_repo.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/gen/assets.gen.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<ResponseState<UserLoginInfoModel>> signIn({
    required String username,
    required String password,
    required Role role,
  }) async {
    AppLogger.debug(role.name, tag: 'MockAuthRepository');
    await SimulateMocRepo();
    return ResponseState(
      data: UserLoginInfoModel(
        id: '',
        name: 'Gbenga Drebak',
        image: role == Role.ORGANIZER
            ? Assets.images.sampleItem3.path
            : Assets.images.sampleItem2.path,
        role: role,
        username: username,
        accessToken: 'bearer dddddd',
        refreshToken: 'beared ddddddds',
        address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
        agentId: '15236612',
      ),
      statusCode: 200,
    );
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
  }) async => ResponseState(data: '', statusCode: 201);

  @override
  Future<ResponseState<bool>> deleteAccount() async => ResponseState(data: true, statusCode: 201);
  @override
  Future<ResponseState<UserLoginInfoModel>> getCurrentUser({required String username}) async {
    final role = appRouter.navigatorKey.currentContext
        ?.read<AuthCubit>()
        .state
        .userLoginInfoModel
        .role;
    return ResponseState(
        data: UserLoginInfoModel(
          id: '',
          name: 'Gbenga Drebak',
        image: role == Role.ORGANIZER
            ? Assets.images.sampleItem3.path
            : Assets.images.sampleItem2.path,
          username: username,
        role: role,
          accessToken: 'accessToken',
          refreshToken: 'refreshToken',
          address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
          agentId: '15236612',
        ),
        statusCode: 200,
      );
  }

  @override
  Future<ResponseState<bool>> resetPassword({
    required String username,
    required String verificationId,
    required String otp,
    required String newPassword,
  }) async => ResponseState(data: true, statusCode: 201);

  @override
  Future<ResponseState<String>> sendOtp({required String username}) async {
    await SimulateMocRepo();
    return ResponseState(data: '5555', statusCode: 201);
  }

  @override
  Future<ResponseState<bool>> signOut() async => ResponseState(data: true, statusCode: 201);

  @override
  Future<ResponseState<String>> signUp({required SignUpModel signUpModel}) async =>
      ResponseState(data: '', statusCode: 201);

  @override
  Future<ResponseState<bool>> verifyOtp({
    required String verificationId,
    required String otp,
  }) async => ResponseState(data: true, statusCode: 200);
}
