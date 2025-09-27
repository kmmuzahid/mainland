import 'package:mainland/common/auth/model/user_login_info_model.dart';
import 'package:mainland/common/auth/model/sign_up_model.dart';
import 'package:mainland/core/config/network/response_state.dart';

abstract class AuthRepository {
  ///email or phone
  Future<ResponseState<UserLoginInfoModel>> signIn({
    required String username,
    required String password,
  });

  Future<ResponseState<String>> signUp({required SignUpModel signUpModel});

  Future<ResponseState<String>> sendOtp({required String username});

  Future<ResponseState<bool>> verifyOtp({required String verificationId, required String otp});

  Future<ResponseState<String>> changePassword({
    required String username,
    required String oldPassword,
    required String newPassword,
  });

  Future<ResponseState<bool>> resetPassword({
    required String username,
    required String verificationId,
    required String otp,
    required String newPassword,
  });

  Future<ResponseState<UserLoginInfoModel>> getCurrentUser({required String username});

  Future<String> signInWithGoogle();

  Future<String> signInWithFacebook();

  Future<ResponseState<bool>> signOut();

  Future<ResponseState<bool>> deleteAccount();
}
