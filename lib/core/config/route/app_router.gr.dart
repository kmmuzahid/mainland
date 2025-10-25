// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i35;
import 'package:collection/collection.dart' as _i41;
import 'package:flutter/material.dart' as _i36;
import 'package:mainland/common/auth/screen/change_password_screen.dart' as _i3;
import 'package:mainland/common/auth/screen/forget_password_screen.dart'
    as _i11;
import 'package:mainland/common/auth/screen/otp_screen.dart' as _i17;
import 'package:mainland/common/auth/screen/profile_info_screen.dart' as _i21;
import 'package:mainland/common/auth/screen/sign_in_screen.dart' as _i24;
import 'package:mainland/common/auth/screen/sign_up_screen.dart' as _i25;
import 'package:mainland/common/chat/model/chat_list_item_model.dart' as _i37;
import 'package:mainland/common/chat/screens/chat_list_screen.dart' as _i4;
import 'package:mainland/common/chat/screens/chat_screen.dart' as _i5;
import 'package:mainland/common/event/screens/all_event_screen.dart' as _i1;
import 'package:mainland/common/event/screens/event_details_screen.dart' as _i9;
import 'package:mainland/common/home/screens/home_screen.dart' as _i12;
import 'package:mainland/common/notifications/screen/notifications_screen.dart'
    as _i14;
import 'package:mainland/common/onboarding_screen/onboarding_screen.dart'
    as _i15;
import 'package:mainland/common/setting/screens/contact_us_screen.dart' as _i6;
import 'package:mainland/common/setting/screens/email_preference_screen.dart'
    as _i8;
import 'package:mainland/common/setting/screens/event_notification_enable_screen.dart'
    as _i10;
import 'package:mainland/common/setting/screens/privacy_policy_screen.dart'
    as _i20;
import 'package:mainland/common/setting/screens/setting_screen.dart' as _i22;
import 'package:mainland/common/setting/screens/terms_condition_screen.dart'
    as _i27;
import 'package:mainland/common/show_info/screen/show_info_screen.dart' as _i23;
import 'package:mainland/common/splash/splash_screen.dart' as _i26;
import 'package:mainland/common/tickets/screens/tickets_screen.dart' as _i31;
import 'package:mainland/common/tickets/widgets/ticket_filter_widget.dart'
    as _i38;
import 'package:mainland/core/app_bar/common_app_bar.dart' as _i40;
import 'package:mainland/organizer/createTicket/screens/create_event_screen.dart'
    as _i7;
import 'package:mainland/organizer/ticketMange/screens/org_ticket_manage.dart'
    as _i16;
import 'package:mainland/user/fanclub/screens/modify_favorite_fan_club.dart'
    as _i13;
import 'package:mainland/user/preferense/cubit/preference_cubit.dart' as _i39;
import 'package:mainland/user/preferense/screen/perfence_subcategory_screen.dart'
    as _i18;
import 'package:mainland/user/preferense/screen/preference_screen.dart' as _i19;
import 'package:mainland/user/ticket/screen/attendie_ticket_availablity_screen.dart'
    as _i2;
import 'package:mainland/user/ticket/screen/ticket_checkout_screen.dart'
    as _i28;
import 'package:mainland/user/ticket/screen/ticket_purchasing_screen.dart'
    as _i29;
import 'package:mainland/user/ticketManage/screens/ticket_save_screen.dart'
    as _i30;
import 'package:mainland/user/ticketManage/screens/user_ticket_manage_screen.dart'
    as _i32;
import 'package:mainland/venue/venueHome/screens/venue_home_screen.dart'
    as _i33;
import 'package:mainland/venue/venueHome/screens/venue_splash_screen.dart'
    as _i34;

/// generated route for
/// [_i1.AllEventScreen]
class AllEventRoute extends _i35.PageRouteInfo<AllEventRouteArgs> {
  AllEventRoute({
    _i36.Key? key,
    required String title,
    dynamic Function(String, String)? onTap,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         AllEventRoute.name,
         args: AllEventRouteArgs(key: key, title: title, onTap: onTap),
         initialChildren: children,
       );

  static const String name = 'AllEventRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AllEventRouteArgs>();
      return _i1.AllEventScreen(
        key: args.key,
        title: args.title,
        onTap: args.onTap,
      );
    },
  );
}

class AllEventRouteArgs {
  const AllEventRouteArgs({this.key, required this.title, this.onTap});

  final _i36.Key? key;

  final String title;

  final dynamic Function(String, String)? onTap;

  @override
  String toString() {
    return 'AllEventRouteArgs{key: $key, title: $title, onTap: $onTap}';
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
/// [_i2.AttendieTicketAvailablityScreen]
class AttendieTicketAvailablityRoute extends _i35.PageRouteInfo<void> {
  const AttendieTicketAvailablityRoute({List<_i35.PageRouteInfo>? children})
    : super(AttendieTicketAvailablityRoute.name, initialChildren: children);

  static const String name = 'AttendieTicketAvailablityRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i2.AttendieTicketAvailablityScreen();
    },
  );
}

/// generated route for
/// [_i3.ChangePasswordScreen]
class ChangePasswordRoute extends _i35.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i35.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChangePasswordScreen();
    },
  );
}

/// generated route for
/// [_i4.ChatListScreen]
class ChatListRoute extends _i35.PageRouteInfo<void> {
  const ChatListRoute({List<_i35.PageRouteInfo>? children})
    : super(ChatListRoute.name, initialChildren: children);

  static const String name = 'ChatListRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i4.ChatListScreen();
    },
  );
}

/// generated route for
/// [_i5.ChatScreen]
class ChatRoute extends _i35.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    required _i37.ChatListItemModel chatListItemModel,
    _i36.Key? key,
    _i36.Widget? action,
    List<_i35.PageRouteInfo>? children,
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

  static _i35.PageInfo page = _i35.PageInfo(
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

  final _i37.ChatListItemModel chatListItemModel;

  final _i36.Key? key;

  final _i36.Widget? action;

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
/// [_i6.ContactUsScreen]
class ContactUsRoute extends _i35.PageRouteInfo<void> {
  const ContactUsRoute({List<_i35.PageRouteInfo>? children})
    : super(ContactUsRoute.name, initialChildren: children);

  static const String name = 'ContactUsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i6.ContactUsScreen();
    },
  );
}

/// generated route for
/// [_i7.CreateEventScreen]
class CreateEventRoute extends _i35.PageRouteInfo<void> {
  const CreateEventRoute({List<_i35.PageRouteInfo>? children})
    : super(CreateEventRoute.name, initialChildren: children);

  static const String name = 'CreateEventRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i7.CreateEventScreen();
    },
  );
}

/// generated route for
/// [_i8.EmailPreferenceScreen]
class EmailPreferenceRoute extends _i35.PageRouteInfo<void> {
  const EmailPreferenceRoute({List<_i35.PageRouteInfo>? children})
    : super(EmailPreferenceRoute.name, initialChildren: children);

  static const String name = 'EmailPreferenceRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i8.EmailPreferenceScreen();
    },
  );
}

/// generated route for
/// [_i9.EventDetailsScreen]
class EventDetailsRoute extends _i35.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    required String eventId,
    _i36.Key? key,
    bool showEventActions = true,
    bool isEventAvailable = true,
    bool isEventUnderReview = false,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         EventDetailsRoute.name,
         args: EventDetailsRouteArgs(
           eventId: eventId,
           key: key,
           showEventActions: showEventActions,
           isEventAvailable: isEventAvailable,
           isEventUnderReview: isEventUnderReview,
         ),
         initialChildren: children,
       );

  static const String name = 'EventDetailsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventDetailsRouteArgs>();
      return _i9.EventDetailsScreen(
        eventId: args.eventId,
        key: args.key,
        showEventActions: args.showEventActions,
        isEventAvailable: args.isEventAvailable,
        isEventUnderReview: args.isEventUnderReview,
      );
    },
  );
}

class EventDetailsRouteArgs {
  const EventDetailsRouteArgs({
    required this.eventId,
    this.key,
    this.showEventActions = true,
    this.isEventAvailable = true,
    this.isEventUnderReview = false,
  });

  final String eventId;

  final _i36.Key? key;

  final bool showEventActions;

  final bool isEventAvailable;

  final bool isEventUnderReview;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{eventId: $eventId, key: $key, showEventActions: $showEventActions, isEventAvailable: $isEventAvailable, isEventUnderReview: $isEventUnderReview}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EventDetailsRouteArgs) return false;
    return eventId == other.eventId &&
        key == other.key &&
        showEventActions == other.showEventActions &&
        isEventAvailable == other.isEventAvailable &&
        isEventUnderReview == other.isEventUnderReview;
  }

  @override
  int get hashCode =>
      eventId.hashCode ^
      key.hashCode ^
      showEventActions.hashCode ^
      isEventAvailable.hashCode ^
      isEventUnderReview.hashCode;
}

/// generated route for
/// [_i10.EventNotificationEnableScreen]
class EventNotificationEnableRoute
    extends _i35.PageRouteInfo<EventNotificationEnableRouteArgs> {
  EventNotificationEnableRoute({
    _i36.Key? key,
    required String title,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         EventNotificationEnableRoute.name,
         args: EventNotificationEnableRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'EventNotificationEnableRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventNotificationEnableRouteArgs>();
      return _i10.EventNotificationEnableScreen(
        key: args.key,
        title: args.title,
      );
    },
  );
}

class EventNotificationEnableRouteArgs {
  const EventNotificationEnableRouteArgs({this.key, required this.title});

  final _i36.Key? key;

  final String title;

  @override
  String toString() {
    return 'EventNotificationEnableRouteArgs{key: $key, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EventNotificationEnableRouteArgs) return false;
    return key == other.key && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode;
}

/// generated route for
/// [_i11.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i35.PageRouteInfo<ForgetPasswordRouteArgs> {
  ForgetPasswordRoute({
    required _i36.TextEditingController newPasswordController,
    _i36.Key? key,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         ForgetPasswordRoute.name,
         args: ForgetPasswordRouteArgs(
           newPasswordController: newPasswordController,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ForgetPasswordRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgetPasswordRouteArgs>();
      return _i11.ForgetPasswordScreen(
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

  final _i36.TextEditingController newPasswordController;

  final _i36.Key? key;

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
/// [_i12.HomeScreen]
class HomeRoute extends _i35.PageRouteInfo<void> {
  const HomeRoute({List<_i35.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i12.HomeScreen();
    },
  );
}

/// generated route for
/// [_i13.ModifyFavoriteFanClub]
class ModifyFavoriteFanClub extends _i35.PageRouteInfo<void> {
  const ModifyFavoriteFanClub({List<_i35.PageRouteInfo>? children})
    : super(ModifyFavoriteFanClub.name, initialChildren: children);

  static const String name = 'ModifyFavoriteFanClub';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i13.ModifyFavoriteFanClub();
    },
  );
}

/// generated route for
/// [_i14.NotificationScreen]
class NotificationRoute extends _i35.PageRouteInfo<void> {
  const NotificationRoute({List<_i35.PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i14.NotificationScreen();
    },
  );
}

/// generated route for
/// [_i15.OnboardingScreen]
class OnboardingRoute extends _i35.PageRouteInfo<void> {
  const OnboardingRoute({List<_i35.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i15.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i16.OrgTicketManageScreen]
class OrgTicketManageRoute
    extends _i35.PageRouteInfo<OrgTicketManageRouteArgs> {
  OrgTicketManageRoute({
    _i36.Key? key,
    required _i38.TicketFilter ticketFilter,
    required String ticketId,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         OrgTicketManageRoute.name,
         args: OrgTicketManageRouteArgs(
           key: key,
           ticketFilter: ticketFilter,
           ticketId: ticketId,
         ),
         initialChildren: children,
       );

  static const String name = 'OrgTicketManageRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrgTicketManageRouteArgs>();
      return _i16.OrgTicketManageScreen(
        key: args.key,
        ticketFilter: args.ticketFilter,
        ticketId: args.ticketId,
      );
    },
  );
}

class OrgTicketManageRouteArgs {
  const OrgTicketManageRouteArgs({
    this.key,
    required this.ticketFilter,
    required this.ticketId,
  });

  final _i36.Key? key;

  final _i38.TicketFilter ticketFilter;

  final String ticketId;

  @override
  String toString() {
    return 'OrgTicketManageRouteArgs{key: $key, ticketFilter: $ticketFilter, ticketId: $ticketId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrgTicketManageRouteArgs) return false;
    return key == other.key &&
        ticketFilter == other.ticketFilter &&
        ticketId == other.ticketId;
  }

  @override
  int get hashCode => key.hashCode ^ ticketFilter.hashCode ^ ticketId.hashCode;
}

/// generated route for
/// [_i17.OtpScreen]
class OtpRoute extends _i35.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    required dynamic Function() onSuccess,
    _i36.Key? key,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         OtpRoute.name,
         args: OtpRouteArgs(onSuccess: onSuccess, key: key),
         initialChildren: children,
       );

  static const String name = 'OtpRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return _i17.OtpScreen(onSuccess: args.onSuccess, key: args.key);
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({required this.onSuccess, this.key});

  final dynamic Function() onSuccess;

  final _i36.Key? key;

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
/// [_i18.PerfenceSubcategoryScreen]
class PerfenceSubcategoryRoute
    extends _i35.PageRouteInfo<PerfenceSubcategoryRouteArgs> {
  PerfenceSubcategoryRoute({
    _i36.Key? key,
    required _i36.Color backgroundColor,
    String? buttonTitle,
    required _i39.PreferenceCubit cubit,
    _i36.Widget? header,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         PerfenceSubcategoryRoute.name,
         args: PerfenceSubcategoryRouteArgs(
           key: key,
           backgroundColor: backgroundColor,
           buttonTitle: buttonTitle,
           cubit: cubit,
           header: header,
         ),
         initialChildren: children,
       );

  static const String name = 'PerfenceSubcategoryRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PerfenceSubcategoryRouteArgs>();
      return _i18.PerfenceSubcategoryScreen(
        key: args.key,
        backgroundColor: args.backgroundColor,
        buttonTitle: args.buttonTitle,
        cubit: args.cubit,
        header: args.header,
      );
    },
  );
}

class PerfenceSubcategoryRouteArgs {
  const PerfenceSubcategoryRouteArgs({
    this.key,
    required this.backgroundColor,
    this.buttonTitle,
    required this.cubit,
    this.header,
  });

  final _i36.Key? key;

  final _i36.Color backgroundColor;

  final String? buttonTitle;

  final _i39.PreferenceCubit cubit;

  final _i36.Widget? header;

  @override
  String toString() {
    return 'PerfenceSubcategoryRouteArgs{key: $key, backgroundColor: $backgroundColor, buttonTitle: $buttonTitle, cubit: $cubit, header: $header}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PerfenceSubcategoryRouteArgs) return false;
    return key == other.key &&
        backgroundColor == other.backgroundColor &&
        buttonTitle == other.buttonTitle &&
        cubit == other.cubit &&
        header == other.header;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      backgroundColor.hashCode ^
      buttonTitle.hashCode ^
      cubit.hashCode ^
      header.hashCode;
}

/// generated route for
/// [_i19.PreferenceScreen]
class PreferenceRoute extends _i35.PageRouteInfo<PreferenceRouteArgs> {
  PreferenceRoute({
    _i36.Key? key,
    _i36.Widget? header,
    String? buttonTitle,
    _i36.Color? backgroundColor,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         PreferenceRoute.name,
         args: PreferenceRouteArgs(
           key: key,
           header: header,
           buttonTitle: buttonTitle,
           backgroundColor: backgroundColor,
         ),
         initialChildren: children,
       );

  static const String name = 'PreferenceRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PreferenceRouteArgs>(
        orElse: () => const PreferenceRouteArgs(),
      );
      return _i19.PreferenceScreen(
        key: args.key,
        header: args.header,
        buttonTitle: args.buttonTitle,
        backgroundColor: args.backgroundColor,
      );
    },
  );
}

class PreferenceRouteArgs {
  const PreferenceRouteArgs({
    this.key,
    this.header,
    this.buttonTitle,
    this.backgroundColor,
  });

  final _i36.Key? key;

  final _i36.Widget? header;

  final String? buttonTitle;

  final _i36.Color? backgroundColor;

  @override
  String toString() {
    return 'PreferenceRouteArgs{key: $key, header: $header, buttonTitle: $buttonTitle, backgroundColor: $backgroundColor}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PreferenceRouteArgs) return false;
    return key == other.key &&
        header == other.header &&
        buttonTitle == other.buttonTitle &&
        backgroundColor == other.backgroundColor;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      header.hashCode ^
      buttonTitle.hashCode ^
      backgroundColor.hashCode;
}

/// generated route for
/// [_i20.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i35.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i35.PageRouteInfo>? children})
    : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i20.PrivacyPolicyScreen();
    },
  );
}

/// generated route for
/// [_i21.ProfileInfoScreen]
class ProfileInfoRoute extends _i35.PageRouteInfo<void> {
  const ProfileInfoRoute({List<_i35.PageRouteInfo>? children})
    : super(ProfileInfoRoute.name, initialChildren: children);

  static const String name = 'ProfileInfoRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i21.ProfileInfoScreen();
    },
  );
}

/// generated route for
/// [_i22.SettingScreen]
class SettingRoute extends _i35.PageRouteInfo<SettingRouteArgs> {
  SettingRoute({
    _i36.Key? key,
    bool showBackButton = false,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         SettingRoute.name,
         args: SettingRouteArgs(key: key, showBackButton: showBackButton),
         initialChildren: children,
       );

  static const String name = 'SettingRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingRouteArgs>(
        orElse: () => const SettingRouteArgs(),
      );
      return _i22.SettingScreen(
        key: args.key,
        showBackButton: args.showBackButton,
      );
    },
  );
}

class SettingRouteArgs {
  const SettingRouteArgs({this.key, this.showBackButton = false});

  final _i36.Key? key;

  final bool showBackButton;

  @override
  String toString() {
    return 'SettingRouteArgs{key: $key, showBackButton: $showBackButton}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SettingRouteArgs) return false;
    return key == other.key && showBackButton == other.showBackButton;
  }

  @override
  int get hashCode => key.hashCode ^ showBackButton.hashCode;
}

/// generated route for
/// [_i23.ShowInfoScreen]
class ShowInfoRoute extends _i35.PageRouteInfo<ShowInfoRouteArgs> {
  ShowInfoRoute({
    _i36.Key? key,
    required String title,
    required String content,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         ShowInfoRoute.name,
         args: ShowInfoRouteArgs(key: key, title: title, content: content),
         initialChildren: children,
       );

  static const String name = 'ShowInfoRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ShowInfoRouteArgs>();
      return _i23.ShowInfoScreen(
        key: args.key,
        title: args.title,
        content: args.content,
      );
    },
  );
}

class ShowInfoRouteArgs {
  const ShowInfoRouteArgs({
    this.key,
    required this.title,
    required this.content,
  });

  final _i36.Key? key;

  final String title;

  final String content;

  @override
  String toString() {
    return 'ShowInfoRouteArgs{key: $key, title: $title, content: $content}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ShowInfoRouteArgs) return false;
    return key == other.key && title == other.title && content == other.content;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode ^ content.hashCode;
}

/// generated route for
/// [_i24.SignInScreen]
class SignInRoute extends _i35.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    required _i36.TextEditingController ctrUsername,
    required _i36.TextEditingController ctrPassword,
    _i36.Key? key,
    List<_i35.PageRouteInfo>? children,
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

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>();
      return _i24.SignInScreen(
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

  final _i36.TextEditingController ctrUsername;

  final _i36.TextEditingController ctrPassword;

  final _i36.Key? key;

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
/// [_i25.SignUpScreen]
class SignUpRoute extends _i35.PageRouteInfo<void> {
  const SignUpRoute({List<_i35.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i25.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i26.SplashScreen]
class SplashRoute extends _i35.PageRouteInfo<void> {
  const SplashRoute({List<_i35.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i26.SplashScreen();
    },
  );
}

/// generated route for
/// [_i27.TermsConditionScreen]
class TermsConditionRoute extends _i35.PageRouteInfo<void> {
  const TermsConditionRoute({List<_i35.PageRouteInfo>? children})
    : super(TermsConditionRoute.name, initialChildren: children);

  static const String name = 'TermsConditionRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i27.TermsConditionScreen();
    },
  );
}

/// generated route for
/// [_i28.TicketCheckoutScreen]
class TicketCheckoutRoute extends _i35.PageRouteInfo<TicketCheckoutRouteArgs> {
  TicketCheckoutRoute({
    _i36.Key? key,
    required _i28.TicketCheckoutType type,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         TicketCheckoutRoute.name,
         args: TicketCheckoutRouteArgs(key: key, type: type),
         initialChildren: children,
       );

  static const String name = 'TicketCheckoutRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketCheckoutRouteArgs>();
      return _i28.TicketCheckoutScreen(key: args.key, type: args.type);
    },
  );
}

class TicketCheckoutRouteArgs {
  const TicketCheckoutRouteArgs({this.key, required this.type});

  final _i36.Key? key;

  final _i28.TicketCheckoutType type;

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

/// generated route for
/// [_i29.TicketPurchaseScreen]
class TicketPurchaseRoute extends _i35.PageRouteInfo<TicketPurchaseRouteArgs> {
  TicketPurchaseRoute({
    _i36.Key? key,
    required _i28.TicketCheckoutType type,
    String? filterTicket,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         TicketPurchaseRoute.name,
         args: TicketPurchaseRouteArgs(
           key: key,
           type: type,
           filterTicket: filterTicket,
         ),
         initialChildren: children,
       );

  static const String name = 'TicketPurchaseRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketPurchaseRouteArgs>();
      return _i29.TicketPurchaseScreen(
        key: args.key,
        type: args.type,
        filterTicket: args.filterTicket,
      );
    },
  );
}

class TicketPurchaseRouteArgs {
  const TicketPurchaseRouteArgs({
    this.key,
    required this.type,
    this.filterTicket,
  });

  final _i36.Key? key;

  final _i28.TicketCheckoutType type;

  final String? filterTicket;

  @override
  String toString() {
    return 'TicketPurchaseRouteArgs{key: $key, type: $type, filterTicket: $filterTicket}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TicketPurchaseRouteArgs) return false;
    return key == other.key &&
        type == other.type &&
        filterTicket == other.filterTicket;
  }

  @override
  int get hashCode => key.hashCode ^ type.hashCode ^ filterTicket.hashCode;
}

/// generated route for
/// [_i30.TicketSaveScreen]
class TicketSaveRoute extends _i35.PageRouteInfo<TicketSaveRouteArgs> {
  TicketSaveRoute({
    _i36.Key? key,
    required String ticketId,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         TicketSaveRoute.name,
         args: TicketSaveRouteArgs(key: key, ticketId: ticketId),
         initialChildren: children,
       );

  static const String name = 'TicketSaveRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketSaveRouteArgs>();
      return _i30.TicketSaveScreen(key: args.key, ticketId: args.ticketId);
    },
  );
}

class TicketSaveRouteArgs {
  const TicketSaveRouteArgs({this.key, required this.ticketId});

  final _i36.Key? key;

  final String ticketId;

  @override
  String toString() {
    return 'TicketSaveRouteArgs{key: $key, ticketId: $ticketId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TicketSaveRouteArgs) return false;
    return key == other.key && ticketId == other.ticketId;
  }

  @override
  int get hashCode => key.hashCode ^ ticketId.hashCode;
}

/// generated route for
/// [_i31.TicketsScreen]
class TicketsRoute extends _i35.PageRouteInfo<TicketsRouteArgs> {
  TicketsRoute({
    _i36.Key? key,
    required dynamic Function(String, _i38.TicketFilter) onTap,
    required List<_i38.TicketFilter> filters,
    String? subTitle,
    String? title,
    double? titleSize,
    _i40.CommonAppBar? appBar,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         TicketsRoute.name,
         args: TicketsRouteArgs(
           key: key,
           onTap: onTap,
           filters: filters,
           subTitle: subTitle,
           title: title,
           titleSize: titleSize,
           appBar: appBar,
         ),
         initialChildren: children,
       );

  static const String name = 'TicketsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketsRouteArgs>();
      return _i31.TicketsScreen(
        key: args.key,
        onTap: args.onTap,
        filters: args.filters,
        subTitle: args.subTitle,
        title: args.title,
        titleSize: args.titleSize,
        appBar: args.appBar,
      );
    },
  );
}

class TicketsRouteArgs {
  const TicketsRouteArgs({
    this.key,
    required this.onTap,
    required this.filters,
    this.subTitle,
    this.title,
    this.titleSize,
    this.appBar,
  });

  final _i36.Key? key;

  final dynamic Function(String, _i38.TicketFilter) onTap;

  final List<_i38.TicketFilter> filters;

  final String? subTitle;

  final String? title;

  final double? titleSize;

  final _i40.CommonAppBar? appBar;

  @override
  String toString() {
    return 'TicketsRouteArgs{key: $key, onTap: $onTap, filters: $filters, subTitle: $subTitle, title: $title, titleSize: $titleSize, appBar: $appBar}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TicketsRouteArgs) return false;
    return key == other.key &&
        const _i41.ListEquality().equals(filters, other.filters) &&
        subTitle == other.subTitle &&
        title == other.title &&
        titleSize == other.titleSize &&
        appBar == other.appBar;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i41.ListEquality().hash(filters) ^
      subTitle.hashCode ^
      title.hashCode ^
      titleSize.hashCode ^
      appBar.hashCode;
}

/// generated route for
/// [_i32.UserTicketManageScreen]
class UserTicketManageRoute
    extends _i35.PageRouteInfo<UserTicketManageRouteArgs> {
  UserTicketManageRoute({
    required _i38.TicketFilter ticketFilter,
    required String ticketId,
    _i36.Key? key,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         UserTicketManageRoute.name,
         args: UserTicketManageRouteArgs(
           ticketFilter: ticketFilter,
           ticketId: ticketId,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'UserTicketManageRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserTicketManageRouteArgs>();
      return _i32.UserTicketManageScreen(
        ticketFilter: args.ticketFilter,
        ticketId: args.ticketId,
        key: args.key,
      );
    },
  );
}

class UserTicketManageRouteArgs {
  const UserTicketManageRouteArgs({
    required this.ticketFilter,
    required this.ticketId,
    this.key,
  });

  final _i38.TicketFilter ticketFilter;

  final String ticketId;

  final _i36.Key? key;

  @override
  String toString() {
    return 'UserTicketManageRouteArgs{ticketFilter: $ticketFilter, ticketId: $ticketId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserTicketManageRouteArgs) return false;
    return ticketFilter == other.ticketFilter &&
        ticketId == other.ticketId &&
        key == other.key;
  }

  @override
  int get hashCode => ticketFilter.hashCode ^ ticketId.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i33.VenueHomeScreen]
class VenueHomeRoute extends _i35.PageRouteInfo<void> {
  const VenueHomeRoute({List<_i35.PageRouteInfo>? children})
    : super(VenueHomeRoute.name, initialChildren: children);

  static const String name = 'VenueHomeRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i33.VenueHomeScreen();
    },
  );
}

/// generated route for
/// [_i34.VenueSplashScreen]
class VenueSplashRoute extends _i35.PageRouteInfo<void> {
  const VenueSplashRoute({List<_i35.PageRouteInfo>? children})
    : super(VenueSplashRoute.name, initialChildren: children);

  static const String name = 'VenueSplashRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i34.VenueSplashScreen();
    },
  );
}
