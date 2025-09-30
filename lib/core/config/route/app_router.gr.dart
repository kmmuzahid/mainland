// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i17;
import 'package:mainland/common/auth/screen/forget_password_screen.dart' as _i3;
import 'package:mainland/common/auth/screen/otp_screen.dart' as _i7;
import 'package:mainland/common/auth/screen/profile_info_screen.dart' as _i9;
import 'package:mainland/common/auth/screen/sign_in_screen.dart' as _i11;
import 'package:mainland/common/auth/screen/sign_up_screen.dart' as _i12;
import 'package:mainland/common/chat/model/chat_list_item_model.dart' as _i16;
import 'package:mainland/common/chat/screens/chat_list_screen.dart' as _i1;
import 'package:mainland/common/chat/screens/chat_screen.dart' as _i2;
import 'package:mainland/common/home/screens/home_screen.dart' as _i4;
import 'package:mainland/common/notifications/screen/notifications_screen.dart'
    as _i5;
import 'package:mainland/common/onboarding_screen/onboarding_screen.dart'
    as _i6;
import 'package:mainland/common/setting/screens/privacy_policy_screen.dart'
    as _i8;
import 'package:mainland/common/setting/screens/setting_screen.dart' as _i10;
import 'package:mainland/common/setting/screens/terms_condition_screen.dart'
    as _i14;
import 'package:mainland/common/splash/splash_screen.dart' as _i13;

/// generated route for
/// [_i1.ChatListScreen]
class ChatListRoute extends _i15.PageRouteInfo<void> {
  const ChatListRoute({List<_i15.PageRouteInfo>? children})
    : super(ChatListRoute.name, initialChildren: children);

  static const String name = 'ChatListRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i1.ChatListScreen();
    },
  );
}

/// generated route for
/// [_i2.ChatScreen]
class ChatRoute extends _i15.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    required _i16.ChatListItemModel chatListItemModel,
    _i17.Key? key,
    _i17.Widget? action,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         ChatRoute.name,
         args: ChatRouteArgs(
           chatListItemModel: chatListItemModel,
           key: key,
           action: action,
         ),
         initialChildren: children,
       );

  static const String name = 'ChatRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatRouteArgs>();
      return _i2.ChatScreen(
        chatListItemModel: args.chatListItemModel,
        key: args.key,
        action: args.action,
      );
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({required this.chatListItemModel, this.key, this.action});

  final _i16.ChatListItemModel chatListItemModel;

  final _i17.Key? key;

  final _i17.Widget? action;

  @override
  String toString() {
    return 'ChatRouteArgs{chatListItemModel: $chatListItemModel, key: $key, action: $action}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatRouteArgs) return false;
    return chatListItemModel == other.chatListItemModel &&
        key == other.key &&
        action == other.action;
  }

  @override
  int get hashCode =>
      chatListItemModel.hashCode ^ key.hashCode ^ action.hashCode;
}

/// generated route for
/// [_i3.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i15.PageRouteInfo<ForgetPasswordRouteArgs> {
  ForgetPasswordRoute({
    required _i17.TextEditingController newPasswordController,
    _i17.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         ForgetPasswordRoute.name,
         args: ForgetPasswordRouteArgs(
           newPasswordController: newPasswordController,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ForgetPasswordRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgetPasswordRouteArgs>();
      return _i3.ForgetPasswordScreen(
        newPasswordController: args.newPasswordController,
        key: args.key,
      );
    },
  );
}

class ForgetPasswordRouteArgs {
  const ForgetPasswordRouteArgs({
    required this.newPasswordController,
    this.key,
  });

  final _i17.TextEditingController newPasswordController;

  final _i17.Key? key;

  @override
  String toString() {
    return 'ForgetPasswordRouteArgs{newPasswordController: $newPasswordController, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForgetPasswordRouteArgs) return false;
    return newPasswordController == other.newPasswordController &&
        key == other.key;
  }

  @override
  int get hashCode => newPasswordController.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.NotificationScreen]
class NotificationRoute extends _i15.PageRouteInfo<void> {
  const NotificationRoute({List<_i15.PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i5.NotificationScreen();
    },
  );
}

/// generated route for
/// [_i6.OnboardingScreen]
class OnboardingRoute extends _i15.PageRouteInfo<void> {
  const OnboardingRoute({List<_i15.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i6.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i7.OtpScreen]
class OtpRoute extends _i15.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    required dynamic Function() onSuccess,
    _i17.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         OtpRoute.name,
         args: OtpRouteArgs(onSuccess: onSuccess, key: key),
         initialChildren: children,
       );

  static const String name = 'OtpRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return _i7.OtpScreen(onSuccess: args.onSuccess, key: args.key);
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({required this.onSuccess, this.key});

  final dynamic Function() onSuccess;

  final _i17.Key? key;

  @override
  String toString() {
    return 'OtpRouteArgs{onSuccess: $onSuccess, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtpRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i8.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i15.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i15.PageRouteInfo>? children})
    : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i8.PrivacyPolicyScreen();
    },
  );
}

/// generated route for
/// [_i9.ProfileInfoScreen]
class ProfileInfoRoute extends _i15.PageRouteInfo<void> {
  const ProfileInfoRoute({List<_i15.PageRouteInfo>? children})
    : super(ProfileInfoRoute.name, initialChildren: children);

  static const String name = 'ProfileInfoRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfileInfoScreen();
    },
  );
}

/// generated route for
/// [_i10.SettingScreen]
class SettingRoute extends _i15.PageRouteInfo<void> {
  const SettingRoute({List<_i15.PageRouteInfo>? children})
    : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i10.SettingScreen();
    },
  );
}

/// generated route for
/// [_i11.SignInScreen]
class SignInRoute extends _i15.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    required _i17.TextEditingController ctrUsername,
    required _i17.TextEditingController ctrPassword,
    _i17.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         SignInRoute.name,
         args: SignInRouteArgs(
           ctrUsername: ctrUsername,
           ctrPassword: ctrPassword,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'SignInRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>();
      return _i11.SignInScreen(
        ctrUsername: args.ctrUsername,
        ctrPassword: args.ctrPassword,
        key: args.key,
      );
    },
  );
}

class SignInRouteArgs {
  const SignInRouteArgs({
    required this.ctrUsername,
    required this.ctrPassword,
    this.key,
  });

  final _i17.TextEditingController ctrUsername;

  final _i17.TextEditingController ctrPassword;

  final _i17.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{ctrUsername: $ctrUsername, ctrPassword: $ctrPassword, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignInRouteArgs) return false;
    return ctrUsername == other.ctrUsername &&
        ctrPassword == other.ctrPassword &&
        key == other.key;
  }

  @override
  int get hashCode =>
      ctrUsername.hashCode ^ ctrPassword.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i12.SignUpScreen]
class SignUpRoute extends _i15.PageRouteInfo<void> {
  const SignUpRoute({List<_i15.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i12.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i13.SplashScreen]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i13.SplashScreen();
    },
  );
}

/// generated route for
/// [_i14.TermsConditionScreen]
class TermsConditionRoute extends _i15.PageRouteInfo<void> {
  const TermsConditionRoute({List<_i15.PageRouteInfo>? children})
    : super(TermsConditionRoute.name, initialChildren: children);

  static const String name = 'TermsConditionRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i14.TermsConditionScreen();
    },
  );
}
