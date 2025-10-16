// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:flutter/material.dart' as _i24;
import 'package:mainland/common/auth/screen/forget_password_screen.dart' as _i7;
import 'package:mainland/common/auth/screen/otp_screen.dart' as _i12;
import 'package:mainland/common/auth/screen/profile_info_screen.dart' as _i15;
import 'package:mainland/common/auth/screen/sign_in_screen.dart' as _i18;
import 'package:mainland/common/auth/screen/sign_up_screen.dart' as _i19;
import 'package:mainland/common/chat/model/chat_list_item_model.dart' as _i25;
import 'package:mainland/common/chat/screens/chat_list_screen.dart' as _i4;
import 'package:mainland/common/chat/screens/chat_screen.dart' as _i5;
import 'package:mainland/common/event/screens/all_event_screen.dart' as _i1;
import 'package:mainland/common/event/screens/event_details_screen.dart' as _i6;
import 'package:mainland/common/home/screens/home_screen.dart' as _i8;
import 'package:mainland/common/notifications/screen/notifications_screen.dart'
    as _i9;
import 'package:mainland/common/onboarding_screen/onboarding_screen.dart'
    as _i10;
import 'package:mainland/common/setting/screens/privacy_policy_screen.dart'
    as _i14;
import 'package:mainland/common/setting/screens/setting_screen.dart' as _i16;
import 'package:mainland/common/setting/screens/terms_condition_screen.dart'
    as _i21;
import 'package:mainland/common/show_info/screen/show_info_screen.dart' as _i17;
import 'package:mainland/common/splash/splash_screen.dart' as _i20;
import 'package:mainland/user/preferense/screen/preference_screen.dart' as _i13;
import 'package:mainland/user/ticket/screen/attendie_ticket_buying_screen.dart'
    as _i2;
import 'package:mainland/user/ticket/screen/attendie_ticket_screen.dart' as _i3;
import 'package:mainland/user/ticket/screen/organizer_ticket_buying_screen.dart'
    as _i11;
import 'package:mainland/user/ticket/screen/ticket_checkout_screen.dart'
    as _i22;

/// generated route for
/// [_i1.AllEventScreen]
class AllEventRoute extends _i23.PageRouteInfo<AllEventRouteArgs> {
  AllEventRoute({
    _i24.Key? key,
    required String title,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         AllEventRoute.name,
         args: AllEventRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'AllEventRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AllEventRouteArgs>();
      return _i1.AllEventScreen(key: args.key, title: args.title);
    },
  );
}

class AllEventRouteArgs {
  const AllEventRouteArgs({this.key, required this.title});

  final _i24.Key? key;

  final String title;

  @override
  String toString() {
    return 'AllEventRouteArgs{key: $key, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AllEventRouteArgs) return false;
    return key == other.key && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode;
}

/// generated route for
/// [_i2.AttendieTicketBuyingScreen]
class AttendieTicketBuyingRoute extends _i23.PageRouteInfo<void> {
  const AttendieTicketBuyingRoute({List<_i23.PageRouteInfo>? children})
    : super(AttendieTicketBuyingRoute.name, initialChildren: children);

  static const String name = 'AttendieTicketBuyingRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i2.AttendieTicketBuyingScreen();
    },
  );
}

/// generated route for
/// [_i3.AttendieTicketScreen]
class AttendieTicketRoute extends _i23.PageRouteInfo<void> {
  const AttendieTicketRoute({List<_i23.PageRouteInfo>? children})
    : super(AttendieTicketRoute.name, initialChildren: children);

  static const String name = 'AttendieTicketRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i3.AttendieTicketScreen();
    },
  );
}

/// generated route for
/// [_i4.ChatListScreen]
class ChatListRoute extends _i23.PageRouteInfo<void> {
  const ChatListRoute({List<_i23.PageRouteInfo>? children})
    : super(ChatListRoute.name, initialChildren: children);

  static const String name = 'ChatListRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i4.ChatListScreen();
    },
  );
}

/// generated route for
/// [_i5.ChatScreen]
class ChatRoute extends _i23.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    required _i25.ChatListItemModel chatListItemModel,
    _i24.Key? key,
    _i24.Widget? action,
    List<_i23.PageRouteInfo>? children,
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

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatRouteArgs>();
      return _i5.ChatScreen(
        chatListItemModel: args.chatListItemModel,
        key: args.key,
        action: args.action,
      );
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({required this.chatListItemModel, this.key, this.action});

  final _i25.ChatListItemModel chatListItemModel;

  final _i24.Key? key;

  final _i24.Widget? action;

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
/// [_i6.EventDetailsScreen]
class EventDetailsRoute extends _i23.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    _i24.Key? key,
    required String eventId,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         EventDetailsRoute.name,
         args: EventDetailsRouteArgs(key: key, eventId: eventId),
         initialChildren: children,
       );

  static const String name = 'EventDetailsRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventDetailsRouteArgs>();
      return _i6.EventDetailsScreen(key: args.key, eventId: args.eventId);
    },
  );
}

class EventDetailsRouteArgs {
  const EventDetailsRouteArgs({this.key, required this.eventId});

  final _i24.Key? key;

  final String eventId;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{key: $key, eventId: $eventId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EventDetailsRouteArgs) return false;
    return key == other.key && eventId == other.eventId;
  }

  @override
  int get hashCode => key.hashCode ^ eventId.hashCode;
}

/// generated route for
/// [_i7.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i23.PageRouteInfo<ForgetPasswordRouteArgs> {
  ForgetPasswordRoute({
    required _i24.TextEditingController newPasswordController,
    _i24.Key? key,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         ForgetPasswordRoute.name,
         args: ForgetPasswordRouteArgs(
           newPasswordController: newPasswordController,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ForgetPasswordRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgetPasswordRouteArgs>();
      return _i7.ForgetPasswordScreen(
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

  final _i24.TextEditingController newPasswordController;

  final _i24.Key? key;

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
/// [_i8.HomeScreen]
class HomeRoute extends _i23.PageRouteInfo<void> {
  const HomeRoute({List<_i23.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i8.HomeScreen();
    },
  );
}

/// generated route for
/// [_i9.NotificationScreen]
class NotificationRoute extends _i23.PageRouteInfo<void> {
  const NotificationRoute({List<_i23.PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i9.NotificationScreen();
    },
  );
}

/// generated route for
/// [_i10.OnboardingScreen]
class OnboardingRoute extends _i23.PageRouteInfo<void> {
  const OnboardingRoute({List<_i23.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i10.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i11.OrganizerTicketBuyingScreen]
class OrganizerTicketBuyingRoute extends _i23.PageRouteInfo<void> {
  const OrganizerTicketBuyingRoute({List<_i23.PageRouteInfo>? children})
    : super(OrganizerTicketBuyingRoute.name, initialChildren: children);

  static const String name = 'OrganizerTicketBuyingRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i11.OrganizerTicketBuyingScreen();
    },
  );
}

/// generated route for
/// [_i12.OtpScreen]
class OtpRoute extends _i23.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    required dynamic Function() onSuccess,
    _i24.Key? key,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         OtpRoute.name,
         args: OtpRouteArgs(onSuccess: onSuccess, key: key),
         initialChildren: children,
       );

  static const String name = 'OtpRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return _i12.OtpScreen(onSuccess: args.onSuccess, key: args.key);
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({required this.onSuccess, this.key});

  final dynamic Function() onSuccess;

  final _i24.Key? key;

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
/// [_i13.PreferenceScreen]
class PreferenceRoute extends _i23.PageRouteInfo<void> {
  const PreferenceRoute({List<_i23.PageRouteInfo>? children})
    : super(PreferenceRoute.name, initialChildren: children);

  static const String name = 'PreferenceRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i13.PreferenceScreen();
    },
  );
}

/// generated route for
/// [_i14.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i23.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i23.PageRouteInfo>? children})
    : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i14.PrivacyPolicyScreen();
    },
  );
}

/// generated route for
/// [_i15.ProfileInfoScreen]
class ProfileInfoRoute extends _i23.PageRouteInfo<void> {
  const ProfileInfoRoute({List<_i23.PageRouteInfo>? children})
    : super(ProfileInfoRoute.name, initialChildren: children);

  static const String name = 'ProfileInfoRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i15.ProfileInfoScreen();
    },
  );
}

/// generated route for
/// [_i16.SettingScreen]
class SettingRoute extends _i23.PageRouteInfo<void> {
  const SettingRoute({List<_i23.PageRouteInfo>? children})
    : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i16.SettingScreen();
    },
  );
}

/// generated route for
/// [_i17.ShowInfoScreen]
class ShowInfoRoute extends _i23.PageRouteInfo<ShowInfoRouteArgs> {
  ShowInfoRoute({
    _i24.Key? key,
    required String title,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         ShowInfoRoute.name,
         args: ShowInfoRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'ShowInfoRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ShowInfoRouteArgs>();
      return _i17.ShowInfoScreen(key: args.key, title: args.title);
    },
  );
}

class ShowInfoRouteArgs {
  const ShowInfoRouteArgs({this.key, required this.title});

  final _i24.Key? key;

  final String title;

  @override
  String toString() {
    return 'ShowInfoRouteArgs{key: $key, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ShowInfoRouteArgs) return false;
    return key == other.key && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode;
}

/// generated route for
/// [_i18.SignInScreen]
class SignInRoute extends _i23.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    required _i24.TextEditingController ctrUsername,
    required _i24.TextEditingController ctrPassword,
    _i24.Key? key,
    List<_i23.PageRouteInfo>? children,
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

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>();
      return _i18.SignInScreen(
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

  final _i24.TextEditingController ctrUsername;

  final _i24.TextEditingController ctrPassword;

  final _i24.Key? key;

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
/// [_i19.SignUpScreen]
class SignUpRoute extends _i23.PageRouteInfo<void> {
  const SignUpRoute({List<_i23.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i19.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i20.SplashScreen]
class SplashRoute extends _i23.PageRouteInfo<void> {
  const SplashRoute({List<_i23.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i20.SplashScreen();
    },
  );
}

/// generated route for
/// [_i21.TermsConditionScreen]
class TermsConditionRoute extends _i23.PageRouteInfo<void> {
  const TermsConditionRoute({List<_i23.PageRouteInfo>? children})
    : super(TermsConditionRoute.name, initialChildren: children);

  static const String name = 'TermsConditionRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i21.TermsConditionScreen();
    },
  );
}

/// generated route for
/// [_i22.TicketCheckoutScreen]
class TicketCheckoutRoute extends _i23.PageRouteInfo<TicketCheckoutRouteArgs> {
  TicketCheckoutRoute({
    _i24.Key? key,
    required _i22.TicketCheckoutType type,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         TicketCheckoutRoute.name,
         args: TicketCheckoutRouteArgs(key: key, type: type),
         initialChildren: children,
       );

  static const String name = 'TicketCheckoutRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketCheckoutRouteArgs>();
      return _i22.TicketCheckoutScreen(key: args.key, type: args.type);
    },
  );
}

class TicketCheckoutRouteArgs {
  const TicketCheckoutRouteArgs({this.key, required this.type});

  final _i24.Key? key;

  final _i22.TicketCheckoutType type;

  @override
  String toString() {
    return 'TicketCheckoutRouteArgs{key: $key, type: $type}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TicketCheckoutRouteArgs) return false;
    return key == other.key && type == other.type;
  }

  @override
  int get hashCode => key.hashCode ^ type.hashCode;
}
