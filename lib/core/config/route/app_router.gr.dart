// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i38;
import 'package:collection/collection.dart' as _i42;
import 'package:flutter/material.dart' as _i39;
import 'package:mainland/common/auth/screen/change_password_screen.dart' as _i4;
import 'package:mainland/common/auth/screen/forget_password_screen.dart'
    as _i13;
import 'package:mainland/common/auth/screen/otp_screen.dart' as _i20;
import 'package:mainland/common/auth/screen/profile_info_screen.dart' as _i24;
import 'package:mainland/common/auth/screen/sign_in_screen.dart' as _i27;
import 'package:mainland/common/auth/screen/sign_up_screen.dart' as _i28;
import 'package:mainland/common/chat/model/chat_list_item_model.dart' as _i43;
import 'package:mainland/common/chat/screens/chat_list_screen.dart' as _i5;
import 'package:mainland/common/chat/screens/chat_screen.dart' as _i6;
import 'package:mainland/common/custom_google_map/model/place_details.dart'
    as _i44;
import 'package:mainland/common/custom_google_map/screen/custom_map_screen.dart'
    as _i9;
import 'package:mainland/common/event/screens/all_event_screen.dart' as _i1;
import 'package:mainland/common/event/screens/event_details_screen.dart'
    as _i11;
import 'package:mainland/common/home/screens/home_screen.dart' as _i14;
import 'package:mainland/common/notifications/screen/notifications_screen.dart'
    as _i17;
import 'package:mainland/common/onboarding_screen/onboarding_screen.dart'
    as _i18;
import 'package:mainland/common/setting/screens/contact_us_screen.dart' as _i7;
import 'package:mainland/common/setting/screens/email_preference_screen.dart'
    as _i10;
import 'package:mainland/common/setting/screens/event_notification_enable_screen.dart'
    as _i12;
import 'package:mainland/common/setting/screens/location_screen.dart' as _i15;
import 'package:mainland/common/setting/screens/privacy_policy_screen.dart'
    as _i23;
import 'package:mainland/common/setting/screens/setting_screen.dart' as _i25;
import 'package:mainland/common/setting/screens/terms_condition_screen.dart'
    as _i30;
import 'package:mainland/common/show_info/screen/show_info_screen.dart' as _i26;
import 'package:mainland/common/splash/splash_screen.dart' as _i29;
import 'package:mainland/common/tickets/model/ticket_model.dart' as _i45;
import 'package:mainland/common/tickets/screens/tickets_screen.dart' as _i34;
import 'package:mainland/core/app_bar/common_app_bar.dart' as _i48;
import 'package:mainland/organizer/createTicket/screens/create_event_screen.dart'
    as _i8;
import 'package:mainland/organizer/ticketMange/screens/org_ticket_manage_screen.dart'
    as _i19;
import 'package:mainland/user/fanclub/screens/modify_favorite_fan_club.dart'
    as _i16;
import 'package:mainland/user/preferense/cubit/preference_cubit.dart' as _i46;
import 'package:mainland/user/preferense/model/category_model.dart' as _i40;
import 'package:mainland/user/preferense/model/sub_category_model.dart' as _i41;
import 'package:mainland/user/preferense/screen/all_selected_preference_screen.dart'
    as _i2;
import 'package:mainland/user/preferense/screen/perfence_subcategory_screen.dart'
    as _i21;
import 'package:mainland/user/preferense/screen/preference_screen.dart' as _i22;
import 'package:mainland/user/ticket/model/ticket_picker_model.dart' as _i47;
import 'package:mainland/user/ticket/screen/attendie_ticket_availablity_screen.dart'
    as _i3;
import 'package:mainland/user/ticket/screen/ticket_checkout_screen.dart'
    as _i31;
import 'package:mainland/user/ticket/screen/ticket_purchasing_screen.dart'
    as _i32;
import 'package:mainland/user/ticketManage/screens/ticket_save_screen.dart'
    as _i33;
import 'package:mainland/user/ticketManage/screens/user_ticket_manage_screen.dart'
    as _i35;
import 'package:mainland/venue/venueHome/screens/venue_home_screen.dart'
    as _i36;
import 'package:mainland/venue/venueHome/screens/venue_splash_screen.dart'
    as _i37;

/// generated route for
/// [_i1.AllEventScreen]
class AllEventRoute extends _i38.PageRouteInfo<AllEventRouteArgs> {
  AllEventRoute({
    _i39.Key? key,
    required String title,
    dynamic Function(String, String)? onTap,
    List<_i38.PageRouteInfo>? children,
  }) : super(
         AllEventRoute.name,
         args: AllEventRouteArgs(key: key, title: title, onTap: onTap),
         initialChildren: children,
       );

  static const String name = 'AllEventRoute';

  static _i38.PageInfo page = _i38.PageInfo(
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

  final _i39.Key? key;

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
/// [_i2.AllSelectedPreferenceScreen]
class AllSelectedPreferenceRoute
    extends _i38.PageRouteInfo<AllSelectedPreferenceRouteArgs> {
  AllSelectedPreferenceRoute({
    _i39.Key? key,
    required Map<_i40.CategoryModel, List<_i41.SubCategoryModel>> categoryData,
    List<_i38.PageRouteInfo>? children,
  }) : super(
         AllSelectedPreferenceRoute.name,
         args: AllSelectedPreferenceRouteArgs(
           key: key,
           categoryData: categoryData,
         ),
         initialChildren: children,
       );

  static const String name = 'AllSelectedPreferenceRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AllSelectedPreferenceRouteArgs>();
      return _i2.AllSelectedPreferenceScreen(
        key: args.key,
        categoryData: args.categoryData,
      );
    },
  );
}

class AllSelectedPreferenceRouteArgs {
  const AllSelectedPreferenceRouteArgs({this.key, required this.categoryData});

  final _i39.Key? key;

  final Map<_i40.CategoryModel, List<_i41.SubCategoryModel>> categoryData;

  @override
  String toString() {
    return 'AllSelectedPreferenceRouteArgs{key: $key, categoryData: $categoryData}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AllSelectedPreferenceRouteArgs) return false;
    return key == other.key &&
        const _i42.MapEquality().equals(categoryData, other.categoryData);
  }

  @override
  int get hashCode =>
      key.hashCode ^ const _i42.MapEquality().hash(categoryData);
}

/// generated route for
/// [_i3.AttendieTicketAvailablityScreen]
class AttendieTicketAvailablityRoute extends _i38.PageRouteInfo<void> {
  const AttendieTicketAvailablityRoute({List<_i38.PageRouteInfo>? children})
    : super(AttendieTicketAvailablityRoute.name, initialChildren: children);

  static const String name = 'AttendieTicketAvailablityRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i3.AttendieTicketAvailablityScreen();
    },
  );
}

/// generated route for
/// [_i4.ChangePasswordScreen]
class ChangePasswordRoute extends _i38.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i38.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i4.ChangePasswordScreen();
    },
  );
}

/// generated route for
/// [_i5.ChatListScreen]
class ChatListRoute extends _i38.PageRouteInfo<void> {
  const ChatListRoute({List<_i38.PageRouteInfo>? children})
    : super(ChatListRoute.name, initialChildren: children);

  static const String name = 'ChatListRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i5.ChatListScreen();
    },
  );
}

/// generated route for
/// [_i6.ChatScreen]
class ChatRoute extends _i38.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    required _i43.ChatListItemModel chatListItemModel,
    _i39.Key? key,
    _i39.Widget? action,
    List<_i38.PageRouteInfo>? children,
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

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatRouteArgs>();
      return _i6.ChatScreen(
        chatListItemModel: args.chatListItemModel,
        key: args.key,
        action: args.action,
      );
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({required this.chatListItemModel, this.key, this.action});

  final _i43.ChatListItemModel chatListItemModel;

  final _i39.Key? key;

  final _i39.Widget? action;

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
/// [_i7.ContactUsScreen]
class ContactUsRoute extends _i38.PageRouteInfo<void> {
  const ContactUsRoute({List<_i38.PageRouteInfo>? children})
    : super(ContactUsRoute.name, initialChildren: children);

  static const String name = 'ContactUsRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i7.ContactUsScreen();
    },
  );
}

/// generated route for
/// [_i8.CreateEventScreen]
class CreateEventRoute extends _i38.PageRouteInfo<CreateEventRouteArgs> {
  CreateEventRoute({
    _i39.Key? key,
    String? draftId,
    List<_i38.PageRouteInfo>? children,
  }) : super(
         CreateEventRoute.name,
         args: CreateEventRouteArgs(key: key, draftId: draftId),
         initialChildren: children,
       );

  static const String name = 'CreateEventRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateEventRouteArgs>(
        orElse: () => const CreateEventRouteArgs(),
      );
      return _i8.CreateEventScreen(key: args.key, draftId: args.draftId);
    },
  );
}

class CreateEventRouteArgs {
  const CreateEventRouteArgs({this.key, this.draftId});

  final _i39.Key? key;

  final String? draftId;

  @override
  String toString() {
    return 'CreateEventRouteArgs{key: $key, draftId: $draftId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateEventRouteArgs) return false;
    return key == other.key && draftId == other.draftId;
  }

  @override
  int get hashCode => key.hashCode ^ draftId.hashCode;
}

/// generated route for
/// [_i9.CustomMapScreen]
class CustomMapRoute extends _i38.PageRouteInfo<CustomMapRouteArgs> {
  CustomMapRoute({
    _i39.Key? key,
    void Function(_i44.PlaceDetails)? onPositionChange,
    List<_i38.PageRouteInfo>? children,
  }) : super(
         CustomMapRoute.name,
         args: CustomMapRouteArgs(key: key, onPositionChange: onPositionChange),
         initialChildren: children,
       );

  static const String name = 'CustomMapRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CustomMapRouteArgs>(
        orElse: () => const CustomMapRouteArgs(),
      );
      return _i9.CustomMapScreen(
        key: args.key,
        onPositionChange: args.onPositionChange,
      );
    },
  );
}

class CustomMapRouteArgs {
  const CustomMapRouteArgs({this.key, this.onPositionChange});

  final _i39.Key? key;

  final void Function(_i44.PlaceDetails)? onPositionChange;

  @override
  String toString() {
    return 'CustomMapRouteArgs{key: $key, onPositionChange: $onPositionChange}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CustomMapRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i10.EmailPreferenceScreen]
class EmailPreferenceRoute extends _i38.PageRouteInfo<void> {
  const EmailPreferenceRoute({List<_i38.PageRouteInfo>? children})
    : super(EmailPreferenceRoute.name, initialChildren: children);

  static const String name = 'EmailPreferenceRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i10.EmailPreferenceScreen();
    },
  );
}

/// generated route for
/// [_i11.EventDetailsScreen]
class EventDetailsRoute extends _i38.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    required String eventId,
    _i39.Key? key,
    bool showEventActions = true,
    bool isEventAvailable = true,
    bool isEventUnderReview = false,
    String? details,
    String? image,
    List<_i38.PageRouteInfo>? children,
  }) : super(
         EventDetailsRoute.name,
         args: EventDetailsRouteArgs(
           eventId: eventId,
           key: key,
           showEventActions: showEventActions,
           isEventAvailable: isEventAvailable,
           isEventUnderReview: isEventUnderReview,
           details: details,
           image: image,
         ),
         initialChildren: children,
       );

  static const String name = 'EventDetailsRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventDetailsRouteArgs>();
      return _i11.EventDetailsScreen(
        eventId: args.eventId,
        key: args.key,
        showEventActions: args.showEventActions,
        isEventAvailable: args.isEventAvailable,
        isEventUnderReview: args.isEventUnderReview,
        details: args.details,
        image: args.image,
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
    this.details,
    this.image,
  });

  final String eventId;

  final _i39.Key? key;

  final bool showEventActions;

  final bool isEventAvailable;

  final bool isEventUnderReview;

  final String? details;

  final String? image;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{eventId: $eventId, key: $key, showEventActions: $showEventActions, isEventAvailable: $isEventAvailable, isEventUnderReview: $isEventUnderReview, details: $details, image: $image}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EventDetailsRouteArgs) return false;
    return eventId == other.eventId &&
        key == other.key &&
        showEventActions == other.showEventActions &&
        isEventAvailable == other.isEventAvailable &&
        isEventUnderReview == other.isEventUnderReview &&
        details == other.details &&
        image == other.image;
  }

  @override
  int get hashCode =>
      eventId.hashCode ^
      key.hashCode ^
      showEventActions.hashCode ^
      isEventAvailable.hashCode ^
      isEventUnderReview.hashCode ^
      details.hashCode ^
      image.hashCode;
}

/// generated route for
/// [_i12.EventNotificationEnableScreen]
class EventNotificationEnableRoute
    extends _i38.PageRouteInfo<EventNotificationEnableRouteArgs> {
  EventNotificationEnableRoute({
    _i39.Key? key,
    required String title,
    List<_i38.PageRouteInfo>? children,
  }) : super(
         EventNotificationEnableRoute.name,
         args: EventNotificationEnableRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'EventNotificationEnableRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventNotificationEnableRouteArgs>();
      return _i12.EventNotificationEnableScreen(
        key: args.key,
        title: args.title,
      );
    },
  );
}

class EventNotificationEnableRouteArgs {
  const EventNotificationEnableRouteArgs({this.key, required this.title});

  final _i39.Key? key;

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
/// [_i13.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i38.PageRouteInfo<ForgetPasswordRouteArgs> {
  ForgetPasswordRoute({
    required _i39.TextEditingController newPasswordController,
    required String verificationToken,
    _i39.Key? key,
    List<_i38.PageRouteInfo>? children,
  }) : super(
         ForgetPasswordRoute.name,
         args: ForgetPasswordRouteArgs(
           newPasswordController: newPasswordController,
           verificationToken: verificationToken,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ForgetPasswordRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgetPasswordRouteArgs>();
      return _i13.ForgetPasswordScreen(
        newPasswordController: args.newPasswordController,
        verificationToken: args.verificationToken,
        key: args.key,
      );
    },
  );
}

class ForgetPasswordRouteArgs {
  const ForgetPasswordRouteArgs({
    required this.newPasswordController,
    required this.verificationToken,
    this.key,
  });

  final _i39.TextEditingController newPasswordController;

  final String verificationToken;

  final _i39.Key? key;

  @override
  String toString() {
    return 'ForgetPasswordRouteArgs{newPasswordController: $newPasswordController, verificationToken: $verificationToken, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForgetPasswordRouteArgs) return false;
    return newPasswordController == other.newPasswordController &&
        verificationToken == other.verificationToken &&
        key == other.key;
  }

  @override
  int get hashCode =>
      newPasswordController.hashCode ^
      verificationToken.hashCode ^
      key.hashCode;
}

/// generated route for
/// [_i14.HomeScreen]
class HomeRoute extends _i38.PageRouteInfo<void> {
  const HomeRoute({List<_i38.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i14.HomeScreen();
    },
  );
}

/// generated route for
/// [_i15.LocationScreen]
class LocationRoute extends _i38.PageRouteInfo<void> {
  const LocationRoute({List<_i38.PageRouteInfo>? children})
    : super(LocationRoute.name, initialChildren: children);

  static const String name = 'LocationRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i15.LocationScreen();
    },
  );
}

/// generated route for
/// [_i16.ModifyFavoriteFanClub]
class ModifyFavoriteFanClub extends _i38.PageRouteInfo<void> {
  const ModifyFavoriteFanClub({List<_i38.PageRouteInfo>? children})
    : super(ModifyFavoriteFanClub.name, initialChildren: children);

  static const String name = 'ModifyFavoriteFanClub';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i16.ModifyFavoriteFanClub();
    },
  );
}

/// generated route for
/// [_i17.NotificationScreen]
class NotificationRoute extends _i38.PageRouteInfo<void> {
  const NotificationRoute({List<_i38.PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i17.NotificationScreen();
    },
  );
}

/// generated route for
/// [_i18.OnboardingScreen]
class OnboardingRoute extends _i38.PageRouteInfo<void> {
  const OnboardingRoute({List<_i38.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i18.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i19.OrgTicketManageScreen]
class OrgTicketManageRoute
    extends _i38.PageRouteInfo<OrgTicketManageRouteArgs> {
  OrgTicketManageRoute({
    _i39.Key? key,
    required _i45.TicketFilter ticketFilter,
    required String ticketId,
    List<_i38.PageRouteInfo>? children,
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

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrgTicketManageRouteArgs>();
      return _i19.OrgTicketManageScreen(
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

  final _i39.Key? key;

  final _i45.TicketFilter ticketFilter;

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
/// [_i20.OtpScreen]
class OtpRoute extends _i38.PageRouteInfo<void> {
  const OtpRoute({List<_i38.PageRouteInfo>? children})
    : super(OtpRoute.name, initialChildren: children);

  static const String name = 'OtpRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i20.OtpScreen();
    },
  );
}

/// generated route for
/// [_i21.PerfenceSubcategoryScreen]
class PerfenceSubcategoryRoute
    extends _i38.PageRouteInfo<PerfenceSubcategoryRouteArgs> {
  PerfenceSubcategoryRoute({
    _i39.Key? key,
    required _i39.Color backgroundColor,
    String? buttonTitle,
    required _i46.PreferenceCubit cubit,
    _i39.Widget? header,
    _i38.PageRouteInfo<Object?>? successRoute,
    dynamic Function(_i40.CategoryModel, _i41.SubCategoryModel)?
    onSubscategoryTap,
    required _i40.CategoryModel category,
    List<_i38.PageRouteInfo>? children,
  }) : super(
         PerfenceSubcategoryRoute.name,
         args: PerfenceSubcategoryRouteArgs(
           key: key,
           backgroundColor: backgroundColor,
           buttonTitle: buttonTitle,
           cubit: cubit,
           header: header,
           successRoute: successRoute,
           onSubscategoryTap: onSubscategoryTap,
           category: category,
         ),
         initialChildren: children,
       );

  static const String name = 'PerfenceSubcategoryRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PerfenceSubcategoryRouteArgs>();
      return _i21.PerfenceSubcategoryScreen(
        key: args.key,
        backgroundColor: args.backgroundColor,
        buttonTitle: args.buttonTitle,
        cubit: args.cubit,
        header: args.header,
        successRoute: args.successRoute,
        onSubscategoryTap: args.onSubscategoryTap,
        category: args.category,
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
    this.successRoute,
    this.onSubscategoryTap,
    required this.category,
  });

  final _i39.Key? key;

  final _i39.Color backgroundColor;

  final String? buttonTitle;

  final _i46.PreferenceCubit cubit;

  final _i39.Widget? header;

  final _i38.PageRouteInfo<Object?>? successRoute;

  final dynamic Function(_i40.CategoryModel, _i41.SubCategoryModel)?
  onSubscategoryTap;

  final _i40.CategoryModel category;

  @override
  String toString() {
    return 'PerfenceSubcategoryRouteArgs{key: $key, backgroundColor: $backgroundColor, buttonTitle: $buttonTitle, cubit: $cubit, header: $header, successRoute: $successRoute, onSubscategoryTap: $onSubscategoryTap, category: $category}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PerfenceSubcategoryRouteArgs) return false;
    return key == other.key &&
        backgroundColor == other.backgroundColor &&
        buttonTitle == other.buttonTitle &&
        cubit == other.cubit &&
        header == other.header &&
        successRoute == other.successRoute &&
        category == other.category;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      backgroundColor.hashCode ^
      buttonTitle.hashCode ^
      cubit.hashCode ^
      header.hashCode ^
      successRoute.hashCode ^
      category.hashCode;
}

/// generated route for
/// [_i22.PreferenceScreen]
class PreferenceRoute extends _i38.PageRouteInfo<PreferenceRouteArgs> {
  PreferenceRoute({
    _i38.PageRouteInfo<Object?>? successRoute,
    _i39.Key? key,
    _i39.Widget? header,
    String? buttonTitle,
    _i39.Color? backgroundColor,
    dynamic Function(_i40.CategoryModel, _i41.SubCategoryModel)?
    onSubscategoryTap,
    bool diableBack = false,
    List<_i38.PageRouteInfo>? children,
  }) : super(
         PreferenceRoute.name,
         args: PreferenceRouteArgs(
           successRoute: successRoute,
           key: key,
           header: header,
           buttonTitle: buttonTitle,
           backgroundColor: backgroundColor,
           onSubscategoryTap: onSubscategoryTap,
           diableBack: diableBack,
         ),
         initialChildren: children,
       );

  static const String name = 'PreferenceRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PreferenceRouteArgs>(
        orElse: () => const PreferenceRouteArgs(),
      );
      return _i22.PreferenceScreen(
        successRoute: args.successRoute,
        key: args.key,
        header: args.header,
        buttonTitle: args.buttonTitle,
        backgroundColor: args.backgroundColor,
        onSubscategoryTap: args.onSubscategoryTap,
        diableBack: args.diableBack,
      );
    },
  );
}

class PreferenceRouteArgs {
  const PreferenceRouteArgs({
    this.successRoute,
    this.key,
    this.header,
    this.buttonTitle,
    this.backgroundColor,
    this.onSubscategoryTap,
    this.diableBack = false,
  });

  final _i38.PageRouteInfo<Object?>? successRoute;

  final _i39.Key? key;

  final _i39.Widget? header;

  final String? buttonTitle;

  final _i39.Color? backgroundColor;

  final dynamic Function(_i40.CategoryModel, _i41.SubCategoryModel)?
  onSubscategoryTap;

  final bool diableBack;

  @override
  String toString() {
    return 'PreferenceRouteArgs{successRoute: $successRoute, key: $key, header: $header, buttonTitle: $buttonTitle, backgroundColor: $backgroundColor, onSubscategoryTap: $onSubscategoryTap, diableBack: $diableBack}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PreferenceRouteArgs) return false;
    return successRoute == other.successRoute &&
        key == other.key &&
        header == other.header &&
        buttonTitle == other.buttonTitle &&
        backgroundColor == other.backgroundColor &&
        diableBack == other.diableBack;
  }

  @override
  int get hashCode =>
      successRoute.hashCode ^
      key.hashCode ^
      header.hashCode ^
      buttonTitle.hashCode ^
      backgroundColor.hashCode ^
      diableBack.hashCode;
}

/// generated route for
/// [_i23.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i38.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i38.PageRouteInfo>? children})
    : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i23.PrivacyPolicyScreen();
    },
  );
}

/// generated route for
/// [_i24.ProfileInfoScreen]
class ProfileInfoRoute extends _i38.PageRouteInfo<void> {
  const ProfileInfoRoute({List<_i38.PageRouteInfo>? children})
    : super(ProfileInfoRoute.name, initialChildren: children);

  static const String name = 'ProfileInfoRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i24.ProfileInfoScreen();
    },
  );
}

/// generated route for
/// [_i25.SettingScreen]
class SettingRoute extends _i38.PageRouteInfo<SettingRouteArgs> {
  SettingRoute({
    _i39.Key? key,
    bool showBackButton = false,
    List<_i38.PageRouteInfo>? children,
  }) : super(
         SettingRoute.name,
         args: SettingRouteArgs(key: key, showBackButton: showBackButton),
         initialChildren: children,
       );

  static const String name = 'SettingRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingRouteArgs>(
        orElse: () => const SettingRouteArgs(),
      );
      return _i25.SettingScreen(
        key: args.key,
        showBackButton: args.showBackButton,
      );
    },
  );
}

class SettingRouteArgs {
  const SettingRouteArgs({this.key, this.showBackButton = false});

  final _i39.Key? key;

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
/// [_i26.ShowInfoScreen]
class ShowInfoRoute extends _i38.PageRouteInfo<ShowInfoRouteArgs> {
  ShowInfoRoute({
    _i39.Key? key,
    required String title,
    required String content,
    List<_i38.PageRouteInfo>? children,
  }) : super(
         ShowInfoRoute.name,
         args: ShowInfoRouteArgs(key: key, title: title, content: content),
         initialChildren: children,
       );

  static const String name = 'ShowInfoRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ShowInfoRouteArgs>();
      return _i26.ShowInfoScreen(
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

  final _i39.Key? key;

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
/// [_i27.SignInScreen]
class SignInRoute extends _i38.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    required _i39.TextEditingController ctrUsername,
    required _i39.TextEditingController ctrPassword,
    _i39.Key? key,
    List<_i38.PageRouteInfo>? children,
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

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>();
      return _i27.SignInScreen(
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

  final _i39.TextEditingController ctrUsername;

  final _i39.TextEditingController ctrPassword;

  final _i39.Key? key;

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
/// [_i28.SignUpScreen]
class SignUpRoute extends _i38.PageRouteInfo<void> {
  const SignUpRoute({List<_i38.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i28.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i29.SplashScreen]
class SplashRoute extends _i38.PageRouteInfo<void> {
  const SplashRoute({List<_i38.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i29.SplashScreen();
    },
  );
}

/// generated route for
/// [_i30.TermsConditionScreen]
class TermsConditionRoute extends _i38.PageRouteInfo<void> {
  const TermsConditionRoute({List<_i38.PageRouteInfo>? children})
    : super(TermsConditionRoute.name, initialChildren: children);

  static const String name = 'TermsConditionRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i30.TermsConditionScreen();
    },
  );
}

/// generated route for
/// [_i31.TicketCheckoutScreen]
class TicketCheckoutRoute extends _i38.PageRouteInfo<TicketCheckoutRouteArgs> {
  TicketCheckoutRoute({
    _i39.Key? key,
    required _i47.TicketOwnerType type,
    List<_i38.PageRouteInfo>? children,
  }) : super(
         TicketCheckoutRoute.name,
         args: TicketCheckoutRouteArgs(key: key, type: type),
         initialChildren: children,
       );

  static const String name = 'TicketCheckoutRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketCheckoutRouteArgs>();
      return _i31.TicketCheckoutScreen(key: args.key, type: args.type);
    },
  );
}

class TicketCheckoutRouteArgs {
  const TicketCheckoutRouteArgs({this.key, required this.type});

  final _i39.Key? key;

  final _i47.TicketOwnerType type;

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
/// [_i32.TicketPurchaseScreen]
class TicketPurchaseRoute extends _i38.PageRouteInfo<TicketPurchaseRouteArgs> {
  TicketPurchaseRoute({
    _i39.Key? key,
    required _i47.TicketOwnerType type,
    _i47.TicketType? filterTicket,
    List<_i38.PageRouteInfo>? children,
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

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketPurchaseRouteArgs>();
      return _i32.TicketPurchaseScreen(
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

  final _i39.Key? key;

  final _i47.TicketOwnerType type;

  final _i47.TicketType? filterTicket;

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
/// [_i33.TicketSaveScreen]
class TicketSaveRoute extends _i38.PageRouteInfo<TicketSaveRouteArgs> {
  TicketSaveRoute({
    _i39.Key? key,
    required String ticketId,
    List<_i38.PageRouteInfo>? children,
  }) : super(
         TicketSaveRoute.name,
         args: TicketSaveRouteArgs(key: key, ticketId: ticketId),
         initialChildren: children,
       );

  static const String name = 'TicketSaveRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketSaveRouteArgs>();
      return _i33.TicketSaveScreen(key: args.key, ticketId: args.ticketId);
    },
  );
}

class TicketSaveRouteArgs {
  const TicketSaveRouteArgs({this.key, required this.ticketId});

  final _i39.Key? key;

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
/// [_i34.TicketsScreen]
class TicketsRoute extends _i38.PageRouteInfo<TicketsRouteArgs> {
  TicketsRoute({
    _i39.Key? key,
    required dynamic Function(String, _i45.TicketFilter) onTap,
    required List<_i45.TicketFilter> filters,
    String? subTitle,
    String? title,
    double? titleSize,
    _i48.CommonAppBar? appBar,
    List<_i38.PageRouteInfo>? children,
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

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketsRouteArgs>();
      return _i34.TicketsScreen(
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

  final _i39.Key? key;

  final dynamic Function(String, _i45.TicketFilter) onTap;

  final List<_i45.TicketFilter> filters;

  final String? subTitle;

  final String? title;

  final double? titleSize;

  final _i48.CommonAppBar? appBar;

  @override
  String toString() {
    return 'TicketsRouteArgs{key: $key, onTap: $onTap, filters: $filters, subTitle: $subTitle, title: $title, titleSize: $titleSize, appBar: $appBar}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TicketsRouteArgs) return false;
    return key == other.key &&
        const _i42.ListEquality().equals(filters, other.filters) &&
        subTitle == other.subTitle &&
        title == other.title &&
        titleSize == other.titleSize &&
        appBar == other.appBar;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i42.ListEquality().hash(filters) ^
      subTitle.hashCode ^
      title.hashCode ^
      titleSize.hashCode ^
      appBar.hashCode;
}

/// generated route for
/// [_i35.UserTicketManageScreen]
class UserTicketManageRoute
    extends _i38.PageRouteInfo<UserTicketManageRouteArgs> {
  UserTicketManageRoute({
    required _i45.TicketFilter ticketFilter,
    required String ticketId,
    _i39.Key? key,
    List<_i38.PageRouteInfo>? children,
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

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserTicketManageRouteArgs>();
      return _i35.UserTicketManageScreen(
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

  final _i45.TicketFilter ticketFilter;

  final String ticketId;

  final _i39.Key? key;

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
/// [_i36.VenueHomeScreen]
class VenueHomeRoute extends _i38.PageRouteInfo<void> {
  const VenueHomeRoute({List<_i38.PageRouteInfo>? children})
    : super(VenueHomeRoute.name, initialChildren: children);

  static const String name = 'VenueHomeRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i36.VenueHomeScreen();
    },
  );
}

/// generated route for
/// [_i37.VenueSplashScreen]
class VenueSplashRoute extends _i38.PageRouteInfo<void> {
  const VenueSplashRoute({List<_i38.PageRouteInfo>? children})
    : super(VenueSplashRoute.name, initialChildren: children);

  static const String name = 'VenueSplashRoute';

  static _i38.PageInfo page = _i38.PageInfo(
    name,
    builder: (data) {
      return const _i37.VenueSplashScreen();
    },
  );
}
