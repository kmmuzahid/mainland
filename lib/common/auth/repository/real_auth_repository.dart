import 'package:mainland/common/auth/model/user_login_info_model.dart';
import 'package:mainland/common/auth/model/sign_up_model.dart';
import 'package:mainland/common/auth/repository/auth_repository.dart';
import 'package:mainland/core/config/network/response_state.dart';

class RealAuthRepository implements AuthRepository {
  @override
  Future<ResponseState<String>> changePassword({
    required String username,
    required String oldPassword,
    required String newPassword,
  }) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<ResponseState<bool>> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<ResponseState<UserLoginInfoModel>> getCurrentUser({required String username}) {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<ResponseState<bool>> resetPassword({
    required String username,
    required String verificationId,
    required String otp,
    required String newPassword,
  }) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<ResponseState<String>> sendOtp({required String username}) {
    // TODO: implement sendOtp
    throw UnimplementedError();
  }

  @override
  Future<ResponseState<UserLoginInfoModel>> signIn({
    required String username,
    required String password,
    required Role role,
  }) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<String> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<String> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<ResponseState<bool>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<ResponseState<String>> signUp({required SignUpModel signUpModel}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<ResponseState<bool>> verifyOtp({required String verificationId, required String otp}) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}
