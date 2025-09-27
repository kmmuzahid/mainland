// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

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
  });

  // Fields
  final bool isLoading;
  final String errMessage;
  final UserLoginInfoModel userLoginInfoModel;



  AuthState copyWith({bool? isLoading, String? errMessage, UserLoginInfoModel? userLoginInfoModel}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errMessage: errMessage ?? this.errMessage,
      userLoginInfoModel: userLoginInfoModel ?? this.userLoginInfoModel,
    );
  }

  @override
  List<Object> get props => [isLoading, errMessage, userLoginInfoModel];
}
