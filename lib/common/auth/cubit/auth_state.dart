// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:mainland/common/auth/model/sign_up_model.dart';

import '../model/user_login_info_model.dart';

class AuthState extends Equatable {
  const AuthState({
    this.userLoginInfoModel = const UserLoginInfoModel(
      id: '',
      name: '',
      image: '',
      address: '',
      username: '',
      accessToken: '',
      refreshToken: '',
      agentId: '',
    ),
    this.isLoading = false,
    this.errMessage = '',
    this.signUpModel = const SignUpModel(
      verificationId: '',
      otp: '',
      password: '',
      fullName: '',
      email: '',
      phone: '',
      registrationType: '',
      country: '',
      city: '',
      state: '',
    ),
  });

  // Fields
  final bool isLoading;
  final String errMessage;
  final UserLoginInfoModel userLoginInfoModel;

  final SignUpModel signUpModel;

  AuthState copyWith({
    bool? isLoading,
    String? errMessage,
    UserLoginInfoModel? userLoginInfoModel,
    SignUpModel? signUpModel,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errMessage: errMessage ?? this.errMessage,
      userLoginInfoModel: userLoginInfoModel ?? this.userLoginInfoModel,
      signUpModel: signUpModel ?? this.signUpModel,
    );
  }

  @override
  List<Object> get props => [
    isLoading,
    errMessage,
    userLoginInfoModel.hashCode,
    signUpModel.hashCode,
  ];
}
