// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:mainland/common/auth/model/sign_up_model.dart';

import '../model/user_login_info_model.dart';

class AuthState extends Equatable {
  const AuthState({
    this.about =
        '<html><body>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem </body></html>',
    this.faqHelp =
        '<html><body>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem </body></html>',

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
    this.isTermsAndConditonsAccepted = false,
    this.age = 0,
  });

  // Fields
  final String about;
  final String faqHelp;
  final bool isLoading;
  final String errMessage;
  final UserLoginInfoModel userLoginInfoModel;

  final SignUpModel signUpModel;
  final bool isTermsAndConditonsAccepted;
  final int age;

  AuthState copyWith({
    bool? isLoading,
    String? errMessage,
    UserLoginInfoModel? userLoginInfoModel,
    SignUpModel? signUpModel,
    String? about,
    String? faqHelp,
    bool? isTermsAndConditonsAccepted,
    int? age,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errMessage: errMessage ?? this.errMessage,
      userLoginInfoModel: userLoginInfoModel ?? this.userLoginInfoModel,
      signUpModel: signUpModel ?? this.signUpModel,
      about: about ?? this.about,
      faqHelp: faqHelp ?? this.faqHelp,
      isTermsAndConditonsAccepted: isTermsAndConditonsAccepted ?? this.isTermsAndConditonsAccepted,
      age: age ?? this.age,
    );
  }

  @override
  List<Object> get props => [
    isLoading,
    errMessage,
    userLoginInfoModel.hashCode,
    signUpModel.hashCode,
    about,
    faqHelp,
    isTermsAndConditonsAccepted,
    age,
  ];
}
