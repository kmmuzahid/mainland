// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i40;
import 'package:collection/collection.dart' as _i45;
import 'package:flutter/foundation.dart' as _i49;
import 'package:flutter/material.dart' as _i41;
import 'package:mainland/common/auth/screen/change_password_screen.dart' as _i4;
import 'package:mainland/common/auth/screen/forget_password_screen.dart'
    as _i14;
import 'package:mainland/common/auth/screen/otp_screen.dart' as _i21;
import 'package:mainland/common/auth/screen/profile_info_screen.dart' as _i26;
import 'package:mainland/common/auth/screen/sign_in_screen.dart' as _i29;
import 'package:mainland/common/auth/screen/sign_up_screen.dart' as _i30;
import 'package:mainland/common/chat/model/chat_list_item_model.dart' as _i46;
import 'package:mainland/common/chat/screens/chat_list_screen.dart' as _i5;
import 'package:mainland/common/chat/screens/chat_screen.dart' as _i6;
import 'package:mainland/common/custom_google_map/model/place_details.dart'
    as _i47;
import 'package:mainland/common/custom_google_map/screen/custom_map_screen.dart'
    as _i9;
import 'package:mainland/common/event/screens/all_event_screen.dart' as _i1;
import 'package:mainland/common/event/screens/event_details_screen.dart'
    as _i11;
import 'package:mainland/common/home/screens/home_screen.dart' as _i15;
import 'package:mainland/common/notifications/screen/notifications_screen.dart'
    as _i18;
import 'package:mainland/common/onboarding_screen/onboarding_screen.dart'
    as _i19;
import 'package:mainland/common/payment/screen/payment_webview.dart' as _i22;
import 'package:mainland/common/setting/cubit/faq_cubit.dart' as _i48;
import 'package:mainland/common/setting/screens/contact_us_screen.dart' as _i7;
import 'package:mainland/common/setting/screens/email_preference_screen.dart'
    as _i10;
import 'package:mainland/common/setting/screens/event_notification_enable_screen.dart'
    as _i12;
import 'package:mainland/common/setting/screens/faq_screen.dart' as _i13;
import 'package:mainland/common/setting/screens/location_screen.dart' as _i16;
import 'package:mainland/common/setting/screens/privacy_policy_screen.dart'
    as _i25;
import 'package:mainland/common/setting/screens/setting_screen.dart' as _i27;
import 'package:mainland/common/setting/screens/terms_condition_screen.dart'
    as _i32;
import 'package:mainland/common/show_info/cubit/info_state.dart' as _i51;
import 'package:mainland/common/show_info/screen/show_info_screen.dart' as _i28;
import 'package:mainland/common/splash/splash_screen.dart' as _i31;
import 'package:mainland/common/tickets/model/ticket_model.dart' as _i42;
import 'package:mainland/common/tickets/screens/tickets_screen.dart' as _i36;
import 'package:mainland/core/app_bar/common_app_bar.dart' as _i55;
import 'package:mainland/organizer/createTicket/model/create_event_model.dart'
    as _i54;
import 'package:mainland/organizer/createTicket/screens/create_event_screen.dart'
    as _i8;
import 'package:mainland/organizer/ticketMange/screens/org_ticket_manage_screen.dart'
    as _i20;
import 'package:mainland/user/fanclub/screens/modify_favorite_fan_club.dart'
    as _i17;
import 'package:mainland/user/preferense/cubit/preference_cubit.dart' as _i50;
import 'package:mainland/user/preferense/model/category_model.dart' as _i43;
import 'package:mainland/user/preferense/model/sub_category_model.dart' as _i44;
import 'package:mainland/user/preferense/screen/all_selected_preference_screen.dart'
    as _i2;
import 'package:mainland/user/preferense/screen/perfence_subcategory_screen.dart'
    as _i23;
import 'package:mainland/user/preferense/screen/preference_screen.dart' as _i24;
import 'package:mainland/user/ticket/cubit/ticket_purchase_cubit.dart' as _i53;
import 'package:mainland/user/ticket/model/ticket_picker_model.dart' as _i52;
import 'package:mainland/user/ticket/screen/attendie_ticket_availablity_screen.dart'
    as _i3;
import 'package:mainland/user/ticket/screen/ticket_checkout_screen.dart'
    as _i33;
import 'package:mainland/user/ticket/screen/ticket_purchase_screen.dart'
    as _i34;
import 'package:mainland/user/ticketManage/screens/ticket_save_screen.dart'
    as _i35;
import 'package:mainland/user/ticketManage/screens/user_ticket_manage_screen.dart'
    as _i37;
import 'package:mainland/venue/venueHome/screens/venue_home_screen.dart'
    as _i38;
import 'package:mainland/venue/venueHome/screens/venue_splash_screen.dart'
    as _i39;

/// generated route for
/// [_i1.AllEventScreen]
class AllEventRoute extends _i40.PageRouteInfo<AllEventRouteArgs> {
  AllEventRoute({
    _i41.Key? key,
    required String title,
    _i42.TicketFilter? ticketFilter,
    dynamic Function(String, String)? onTap,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         AllEventRoute.name,
         args: AllEventRouteArgs(
           key: key,
           title: title,
           ticketFilter: ticketFilter,
           onTap: onTap,
         ),
         initialChildren: children,
       );

  static const String name = 'AllEventRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AllEventRouteArgs>();
      return _i1.AllEventScreen(
        key: args.key,
        title: args.title,
        ticketFilter: args.ticketFilter,
        onTap: args.onTap,
      );
    },
  );
}

class AllEventRouteArgs {
  const AllEventRouteArgs({
    this.key,
    required this.title,
    this.ticketFilter,
    this.onTap,
  });

  final _i41.Key? key;

  final String title;

  final _i42.TicketFilter? ticketFilter;

  final dynamic Function(String, String)? onTap;

  @override
  String toString() {
    return 'AllEventRouteArgs{key: $key, title: $title, ticketFilter: $ticketFilter, onTap: $onTap}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AllEventRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        ticketFilter == other.ticketFilter;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode ^ ticketFilter.hashCode;
}

/// generated route for
/// [_i2.AllSelectedPreferenceScreen]
class AllSelectedPreferenceRoute
    extends _i40.PageRouteInfo<AllSelectedPreferenceRouteArgs> {
  AllSelectedPreferenceRoute({
    _i41.Key? key,
    required Map<_i43.CategoryModel, List<_i44.SubCategoryModel>> categoryData,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         AllSelectedPreferenceRoute.name,
         args: AllSelectedPreferenceRouteArgs(
           key: key,
           categoryData: categoryData,
         ),
         initialChildren: children,
       );

  static const String name = 'AllSelectedPreferenceRoute';

  static _i40.PageInfo page = _i40.PageInfo(
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

  final _i41.Key? key;

  final Map<_i43.CategoryModel, List<_i44.SubCategoryModel>> categoryData;

  @override
  String toString() {
    return 'AllSelectedPreferenceRouteArgs{key: $key, categoryData: $categoryData}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AllSelectedPreferenceRouteArgs) return false;
    return key == other.key &&
        const _i45.MapEquality().equals(categoryData, other.categoryData);
  }

  @override
  int get hashCode =>
      key.hashCode ^ const _i45.MapEquality().hash(categoryData);
}

/// generated route for
/// [_i3.AttendieTicketAvailablityScreen]
class AttendieTicketAvailablityRoute
    extends _i40.PageRouteInfo<AttendieTicketAvailablityRouteArgs> {
  AttendieTicketAvailablityRoute({
    required String eventId,
    required String eventName,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         AttendieTicketAvailablityRoute.name,
         args: AttendieTicketAvailablityRouteArgs(
           eventId: eventId,
           eventName: eventName,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'AttendieTicketAvailablityRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AttendieTicketAvailablityRouteArgs>();
      return _i3.AttendieTicketAvailablityScreen(
        eventId: args.eventId,
        eventName: args.eventName,
        key: args.key,
      );
    },
  );
}

class AttendieTicketAvailablityRouteArgs {
  const AttendieTicketAvailablityRouteArgs({
    required this.eventId,
    required this.eventName,
    this.key,
  });

  final String eventId;

  final String eventName;

  final _i41.Key? key;

  @override
  String toString() {
    return 'AttendieTicketAvailablityRouteArgs{eventId: $eventId, eventName: $eventName, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AttendieTicketAvailablityRouteArgs) return false;
    return eventId == other.eventId &&
        eventName == other.eventName &&
        key == other.key;
  }

  @override
  int get hashCode => eventId.hashCode ^ eventName.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i4.ChangePasswordScreen]
class ChangePasswordRoute extends _i40.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i40.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i4.ChangePasswordScreen();
    },
  );
}

/// generated route for
/// [_i5.ChatListScreen]
class ChatListRoute extends _i40.PageRouteInfo<void> {
  const ChatListRoute({List<_i40.PageRouteInfo>? children})
    : super(ChatListRoute.name, initialChildren: children);

  static const String name = 'ChatListRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i5.ChatListScreen();
    },
  );
}

/// generated route for
/// [_i6.ChatScreen]
class ChatRoute extends _i40.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    required _i46.ChatListItemModel chatListItemModel,
    _i41.Key? key,
    _i41.Widget? action,
    String? userId,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         ChatRoute.name,
         args: ChatRouteArgs(
           chatListItemModel: chatListItemModel,
           key: key,
           action: action,
           userId: userId,
         ),
         initialChildren: children,
       );

  static const String name = 'ChatRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatRouteArgs>();
      return _i6.ChatScreen(
        chatListItemModel: args.chatListItemModel,
        key: args.key,
        action: args.action,
        userId: args.userId,
      );
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({
    required this.chatListItemModel,
    this.key,
    this.action,
    this.userId,
  });

  final _i46.ChatListItemModel chatListItemModel;

  final _i41.Key? key;

  final _i41.Widget? action;

  final String? userId;

  @override
  String toString() {
    return 'ChatRouteArgs{chatListItemModel: $chatListItemModel, key: $key, action: $action, userId: $userId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatRouteArgs) return false;
    return chatListItemModel == other.chatListItemModel &&
        key == other.key &&
        action == other.action &&
        userId == other.userId;
  }

  @override
  int get hashCode =>
      chatListItemModel.hashCode ^
      key.hashCode ^
      action.hashCode ^
      userId.hashCode;
}

/// generated route for
/// [_i7.ContactUsScreen]
class ContactUsRoute extends _i40.PageRouteInfo<void> {
  const ContactUsRoute({List<_i40.PageRouteInfo>? children})
    : super(ContactUsRoute.name, initialChildren: children);

  static const String name = 'ContactUsRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i7.ContactUsScreen();
    },
  );
}

/// generated route for
/// [_i8.CreateEventScreen]
class CreateEventRoute extends _i40.PageRouteInfo<CreateEventRouteArgs> {
  CreateEventRoute({
    _i41.Key? key,
    String? draftId,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         CreateEventRoute.name,
         args: CreateEventRouteArgs(key: key, draftId: draftId),
         initialChildren: children,
       );

  static const String name = 'CreateEventRoute';

  static _i40.PageInfo page = _i40.PageInfo(
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

  final _i41.Key? key;

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
class CustomMapRoute extends _i40.PageRouteInfo<CustomMapRouteArgs> {
  CustomMapRoute({
    _i41.Key? key,
    void Function(_i47.PlaceDetails)? onPositionChange,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         CustomMapRoute.name,
         args: CustomMapRouteArgs(key: key, onPositionChange: onPositionChange),
         initialChildren: children,
       );

  static const String name = 'CustomMapRoute';

  static _i40.PageInfo page = _i40.PageInfo(
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

  final _i41.Key? key;

  final void Function(_i47.PlaceDetails)? onPositionChange;

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
class EmailPreferenceRoute extends _i40.PageRouteInfo<void> {
  const EmailPreferenceRoute({List<_i40.PageRouteInfo>? children})
    : super(EmailPreferenceRoute.name, initialChildren: children);

  static const String name = 'EmailPreferenceRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i10.EmailPreferenceScreen();
    },
  );
}

/// generated route for
/// [_i11.EventDetailsScreen]
class EventDetailsRoute extends _i40.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    required String eventId,
    _i41.Key? key,
    bool showEventActions = true,
    bool isEventAvailable = true,
    bool isEventUnderReview = false,
    String? details,
    String? image,
    List<_i40.PageRouteInfo>? children,
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

  static _i40.PageInfo page = _i40.PageInfo(
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

  final _i41.Key? key;

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
    extends _i40.PageRouteInfo<EventNotificationEnableRouteArgs> {
  EventNotificationEnableRoute({
    required String id,
    required String title,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         EventNotificationEnableRoute.name,
         args: EventNotificationEnableRouteArgs(id: id, title: title, key: key),
         initialChildren: children,
       );

  static const String name = 'EventNotificationEnableRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventNotificationEnableRouteArgs>();
      return _i12.EventNotificationEnableScreen(
        id: args.id,
        title: args.title,
        key: args.key,
      );
    },
  );
}

class EventNotificationEnableRouteArgs {
  const EventNotificationEnableRouteArgs({
    required this.id,
    required this.title,
    this.key,
  });

  final String id;

  final String title;

  final _i41.Key? key;

  @override
  String toString() {
    return 'EventNotificationEnableRouteArgs{id: $id, title: $title, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EventNotificationEnableRouteArgs) return false;
    return id == other.id && title == other.title && key == other.key;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i13.FaqScreen]
class FaqRoute extends _i40.PageRouteInfo<FaqRouteArgs> {
  FaqRoute({
    required _i48.FaqType faqType,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         FaqRoute.name,
         args: FaqRouteArgs(faqType: faqType, key: key),
         initialChildren: children,
       );

  static const String name = 'FaqRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FaqRouteArgs>();
      return _i13.FaqScreen(faqType: args.faqType, key: args.key);
    },
  );
}

class FaqRouteArgs {
  const FaqRouteArgs({required this.faqType, this.key});

  final _i48.FaqType faqType;

  final _i41.Key? key;

  @override
  String toString() {
    return 'FaqRouteArgs{faqType: $faqType, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FaqRouteArgs) return false;
    return faqType == other.faqType && key == other.key;
  }

  @override
  int get hashCode => faqType.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i14.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i40.PageRouteInfo<ForgetPasswordRouteArgs> {
  ForgetPasswordRoute({
    required _i41.TextEditingController newPasswordController,
    required String verificationToken,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
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

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgetPasswordRouteArgs>();
      return _i14.ForgetPasswordScreen(
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

  final _i41.TextEditingController newPasswordController;

  final String verificationToken;

  final _i41.Key? key;

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
/// [_i15.HomeScreen]
class HomeRoute extends _i40.PageRouteInfo<void> {
  const HomeRoute({List<_i40.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i15.HomeScreen();
    },
  );
}

/// generated route for
/// [_i16.LocationScreen]
class LocationRoute extends _i40.PageRouteInfo<void> {
  const LocationRoute({List<_i40.PageRouteInfo>? children})
    : super(LocationRoute.name, initialChildren: children);

  static const String name = 'LocationRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i16.LocationScreen();
    },
  );
}

/// generated route for
/// [_i17.ModifyFavoriteFanClub]
class ModifyFavoriteFanClub extends _i40.PageRouteInfo<void> {
  const ModifyFavoriteFanClub({List<_i40.PageRouteInfo>? children})
    : super(ModifyFavoriteFanClub.name, initialChildren: children);

  static const String name = 'ModifyFavoriteFanClub';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i17.ModifyFavoriteFanClub();
    },
  );
}

/// generated route for
/// [_i18.NotificationScreen]
class NotificationRoute extends _i40.PageRouteInfo<void> {
  const NotificationRoute({List<_i40.PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i18.NotificationScreen();
    },
  );
}

/// generated route for
/// [_i19.OnboardingScreen]
class OnboardingRoute extends _i40.PageRouteInfo<void> {
  const OnboardingRoute({List<_i40.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i19.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i20.OrgTicketManageScreen]
class OrgTicketManageRoute
    extends _i40.PageRouteInfo<OrgTicketManageRouteArgs> {
  OrgTicketManageRoute({
    required _i42.TicketFilter ticketFilter,
    required String eventId,
    required String eventName,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         OrgTicketManageRoute.name,
         args: OrgTicketManageRouteArgs(
           ticketFilter: ticketFilter,
           eventId: eventId,
           eventName: eventName,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'OrgTicketManageRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrgTicketManageRouteArgs>();
      return _i20.OrgTicketManageScreen(
        ticketFilter: args.ticketFilter,
        eventId: args.eventId,
        eventName: args.eventName,
        key: args.key,
      );
    },
  );
}

class OrgTicketManageRouteArgs {
  const OrgTicketManageRouteArgs({
    required this.ticketFilter,
    required this.eventId,
    required this.eventName,
    this.key,
  });

  final _i42.TicketFilter ticketFilter;

  final String eventId;

  final String eventName;

  final _i41.Key? key;

  @override
  String toString() {
    return 'OrgTicketManageRouteArgs{ticketFilter: $ticketFilter, eventId: $eventId, eventName: $eventName, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrgTicketManageRouteArgs) return false;
    return ticketFilter == other.ticketFilter &&
        eventId == other.eventId &&
        eventName == other.eventName &&
        key == other.key;
  }

  @override
  int get hashCode =>
      ticketFilter.hashCode ^
      eventId.hashCode ^
      eventName.hashCode ^
      key.hashCode;
}

/// generated route for
/// [_i21.OtpScreen]
class OtpRoute extends _i40.PageRouteInfo<void> {
  const OtpRoute({List<_i40.PageRouteInfo>? children})
    : super(OtpRoute.name, initialChildren: children);

  static const String name = 'OtpRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i21.OtpScreen();
    },
  );
}

/// generated route for
/// [_i22.PaymentWebView]
class PaymentWebView extends _i40.PageRouteInfo<PaymentWebViewArgs> {
  PaymentWebView({
    required String checkoutUrl,
    required Function onCancel,
    required Function onSuccess,
    _i49.Key? key,
    void Function(String)? onFailed,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         PaymentWebView.name,
         args: PaymentWebViewArgs(
           checkoutUrl: checkoutUrl,
           onCancel: onCancel,
           onSuccess: onSuccess,
           key: key,
           onFailed: onFailed,
         ),
         initialChildren: children,
       );

  static const String name = 'PaymentWebView';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentWebViewArgs>();
      return _i22.PaymentWebView(
        checkoutUrl: args.checkoutUrl,
        onCancel: args.onCancel,
        onSuccess: args.onSuccess,
        key: args.key,
        onFailed: args.onFailed,
      );
    },
  );
}

class PaymentWebViewArgs {
  const PaymentWebViewArgs({
    required this.checkoutUrl,
    required this.onCancel,
    required this.onSuccess,
    this.key,
    this.onFailed,
  });

  final String checkoutUrl;

  final Function onCancel;

  final Function onSuccess;

  final _i49.Key? key;

  final void Function(String)? onFailed;

  @override
  String toString() {
    return 'PaymentWebViewArgs{checkoutUrl: $checkoutUrl, onCancel: $onCancel, onSuccess: $onSuccess, key: $key, onFailed: $onFailed}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PaymentWebViewArgs) return false;
    return checkoutUrl == other.checkoutUrl &&
        onCancel == other.onCancel &&
        onSuccess == other.onSuccess &&
        key == other.key;
  }

  @override
  int get hashCode =>
      checkoutUrl.hashCode ^
      onCancel.hashCode ^
      onSuccess.hashCode ^
      key.hashCode;
}

/// generated route for
/// [_i23.PerfenceSubcategoryScreen]
class PerfenceSubcategoryRoute
    extends _i40.PageRouteInfo<PerfenceSubcategoryRouteArgs> {
  PerfenceSubcategoryRoute({
    _i41.Key? key,
    required _i41.Color backgroundColor,
    String? buttonTitle,
    required _i50.PreferenceCubit cubit,
    _i41.Widget? header,
    _i40.PageRouteInfo<Object?>? successRoute,
    dynamic Function(_i43.CategoryModel, _i44.SubCategoryModel)?
    onSubscategoryTap,
    required _i43.CategoryModel category,
    List<_i40.PageRouteInfo>? children,
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

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PerfenceSubcategoryRouteArgs>();
      return _i23.PerfenceSubcategoryScreen(
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

  final _i41.Key? key;

  final _i41.Color backgroundColor;

  final String? buttonTitle;

  final _i50.PreferenceCubit cubit;

  final _i41.Widget? header;

  final _i40.PageRouteInfo<Object?>? successRoute;

  final dynamic Function(_i43.CategoryModel, _i44.SubCategoryModel)?
  onSubscategoryTap;

  final _i43.CategoryModel category;

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
/// [_i24.PreferenceScreen]
class PreferenceRoute extends _i40.PageRouteInfo<PreferenceRouteArgs> {
  PreferenceRoute({
    _i40.PageRouteInfo<Object?>? successRoute,
    _i41.Key? key,
    _i41.Widget? header,
    String? buttonTitle,
    _i41.Color? backgroundColor,
    dynamic Function(_i43.CategoryModel, _i44.SubCategoryModel)?
    onSubscategoryTap,
    bool diableBack = false,
    bool includeSelectedSubcategory = true,
    List<_i40.PageRouteInfo>? children,
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
           includeSelectedSubcategory: includeSelectedSubcategory,
         ),
         initialChildren: children,
       );

  static const String name = 'PreferenceRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PreferenceRouteArgs>(
        orElse: () => const PreferenceRouteArgs(),
      );
      return _i24.PreferenceScreen(
        successRoute: args.successRoute,
        key: args.key,
        header: args.header,
        buttonTitle: args.buttonTitle,
        backgroundColor: args.backgroundColor,
        onSubscategoryTap: args.onSubscategoryTap,
        diableBack: args.diableBack,
        includeSelectedSubcategory: args.includeSelectedSubcategory,
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
    this.includeSelectedSubcategory = true,
  });

  final _i40.PageRouteInfo<Object?>? successRoute;

  final _i41.Key? key;

  final _i41.Widget? header;

  final String? buttonTitle;

  final _i41.Color? backgroundColor;

  final dynamic Function(_i43.CategoryModel, _i44.SubCategoryModel)?
  onSubscategoryTap;

  final bool diableBack;

  final bool includeSelectedSubcategory;

  @override
  String toString() {
    return 'PreferenceRouteArgs{successRoute: $successRoute, key: $key, header: $header, buttonTitle: $buttonTitle, backgroundColor: $backgroundColor, onSubscategoryTap: $onSubscategoryTap, diableBack: $diableBack, includeSelectedSubcategory: $includeSelectedSubcategory}';
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
        diableBack == other.diableBack &&
        includeSelectedSubcategory == other.includeSelectedSubcategory;
  }

  @override
  int get hashCode =>
      successRoute.hashCode ^
      key.hashCode ^
      header.hashCode ^
      buttonTitle.hashCode ^
      backgroundColor.hashCode ^
      diableBack.hashCode ^
      includeSelectedSubcategory.hashCode;
}

/// generated route for
/// [_i25.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i40.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i40.PageRouteInfo>? children})
    : super(PrivacyPolicyRoute.name, initialChildren: children);

  static const String name = 'PrivacyPolicyRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i25.PrivacyPolicyScreen();
    },
  );
}

/// generated route for
/// [_i26.ProfileInfoScreen]
class ProfileInfoRoute extends _i40.PageRouteInfo<void> {
  const ProfileInfoRoute({List<_i40.PageRouteInfo>? children})
    : super(ProfileInfoRoute.name, initialChildren: children);

  static const String name = 'ProfileInfoRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i26.ProfileInfoScreen();
    },
  );
}

/// generated route for
/// [_i27.SettingScreen]
class SettingRoute extends _i40.PageRouteInfo<SettingRouteArgs> {
  SettingRoute({
    _i41.Key? key,
    bool showBackButton = false,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         SettingRoute.name,
         args: SettingRouteArgs(key: key, showBackButton: showBackButton),
         initialChildren: children,
       );

  static const String name = 'SettingRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingRouteArgs>(
        orElse: () => const SettingRouteArgs(),
      );
      return _i27.SettingScreen(
        key: args.key,
        showBackButton: args.showBackButton,
      );
    },
  );
}

class SettingRouteArgs {
  const SettingRouteArgs({this.key, this.showBackButton = false});

  final _i41.Key? key;

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
/// [_i28.ShowInfoScreen]
class ShowInfoRoute extends _i40.PageRouteInfo<ShowInfoRouteArgs> {
  ShowInfoRoute({
    _i41.Key? key,
    required String title,
    required _i51.InfoType infoType,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         ShowInfoRoute.name,
         args: ShowInfoRouteArgs(key: key, title: title, infoType: infoType),
         initialChildren: children,
       );

  static const String name = 'ShowInfoRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ShowInfoRouteArgs>();
      return _i28.ShowInfoScreen(
        key: args.key,
        title: args.title,
        infoType: args.infoType,
      );
    },
  );
}

class ShowInfoRouteArgs {
  const ShowInfoRouteArgs({
    this.key,
    required this.title,
    required this.infoType,
  });

  final _i41.Key? key;

  final String title;

  final _i51.InfoType infoType;

  @override
  String toString() {
    return 'ShowInfoRouteArgs{key: $key, title: $title, infoType: $infoType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ShowInfoRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        infoType == other.infoType;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode ^ infoType.hashCode;
}

/// generated route for
/// [_i29.SignInScreen]
class SignInRoute extends _i40.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    required _i41.TextEditingController ctrUsername,
    required _i41.TextEditingController ctrPassword,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
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

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignInRouteArgs>();
      return _i29.SignInScreen(
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

  final _i41.TextEditingController ctrUsername;

  final _i41.TextEditingController ctrPassword;

  final _i41.Key? key;

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
/// [_i30.SignUpScreen]
class SignUpRoute extends _i40.PageRouteInfo<void> {
  const SignUpRoute({List<_i40.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i30.SignUpScreen();
    },
  );
}

/// generated route for
/// [_i31.SplashScreen]
class SplashRoute extends _i40.PageRouteInfo<void> {
  const SplashRoute({List<_i40.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i31.SplashScreen();
    },
  );
}

/// generated route for
/// [_i32.TermsConditionScreen]
class TermsConditionRoute extends _i40.PageRouteInfo<void> {
  const TermsConditionRoute({List<_i40.PageRouteInfo>? children})
    : super(TermsConditionRoute.name, initialChildren: children);

  static const String name = 'TermsConditionRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i32.TermsConditionScreen();
    },
  );
}

/// generated route for
/// [_i33.TicketCheckoutScreen]
class TicketCheckoutRoute extends _i40.PageRouteInfo<TicketCheckoutRouteArgs> {
  TicketCheckoutRoute({
    required _i52.TicketOwnerType type,
    required _i53.TicketPurchaseCubit cubit,
    required String title,
    required _i52.TicketOwnerType ticketOwnerType,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         TicketCheckoutRoute.name,
         args: TicketCheckoutRouteArgs(
           type: type,
           cubit: cubit,
           title: title,
           ticketOwnerType: ticketOwnerType,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'TicketCheckoutRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketCheckoutRouteArgs>();
      return _i33.TicketCheckoutScreen(
        type: args.type,
        cubit: args.cubit,
        title: args.title,
        ticketOwnerType: args.ticketOwnerType,
        key: args.key,
      );
    },
  );
}

class TicketCheckoutRouteArgs {
  const TicketCheckoutRouteArgs({
    required this.type,
    required this.cubit,
    required this.title,
    required this.ticketOwnerType,
    this.key,
  });

  final _i52.TicketOwnerType type;

  final _i53.TicketPurchaseCubit cubit;

  final String title;

  final _i52.TicketOwnerType ticketOwnerType;

  final _i41.Key? key;

  @override
  String toString() {
    return 'TicketCheckoutRouteArgs{type: $type, cubit: $cubit, title: $title, ticketOwnerType: $ticketOwnerType, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TicketCheckoutRouteArgs) return false;
    return type == other.type &&
        cubit == other.cubit &&
        title == other.title &&
        ticketOwnerType == other.ticketOwnerType &&
        key == other.key;
  }

  @override
  int get hashCode =>
      type.hashCode ^
      cubit.hashCode ^
      title.hashCode ^
      ticketOwnerType.hashCode ^
      key.hashCode;
}

/// generated route for
/// [_i34.TicketPurchaseScreen]
class TicketPurchaseRoute extends _i40.PageRouteInfo<TicketPurchaseRouteArgs> {
  TicketPurchaseRoute({
    required _i52.TicketOwnerType type,
    required String id,
    required String title,
    required _i52.TicketOwnerType ticketOwnerType,
    _i41.Key? key,
    _i54.TicketName? filterTicket,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         TicketPurchaseRoute.name,
         args: TicketPurchaseRouteArgs(
           type: type,
           id: id,
           title: title,
           ticketOwnerType: ticketOwnerType,
           key: key,
           filterTicket: filterTicket,
         ),
         initialChildren: children,
       );

  static const String name = 'TicketPurchaseRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketPurchaseRouteArgs>();
      return _i34.TicketPurchaseScreen(
        type: args.type,
        id: args.id,
        title: args.title,
        ticketOwnerType: args.ticketOwnerType,
        key: args.key,
        filterTicket: args.filterTicket,
      );
    },
  );
}

class TicketPurchaseRouteArgs {
  const TicketPurchaseRouteArgs({
    required this.type,
    required this.id,
    required this.title,
    required this.ticketOwnerType,
    this.key,
    this.filterTicket,
  });

  final _i52.TicketOwnerType type;

  final String id;

  final String title;

  final _i52.TicketOwnerType ticketOwnerType;

  final _i41.Key? key;

  final _i54.TicketName? filterTicket;

  @override
  String toString() {
    return 'TicketPurchaseRouteArgs{type: $type, id: $id, title: $title, ticketOwnerType: $ticketOwnerType, key: $key, filterTicket: $filterTicket}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TicketPurchaseRouteArgs) return false;
    return type == other.type &&
        id == other.id &&
        title == other.title &&
        ticketOwnerType == other.ticketOwnerType &&
        key == other.key &&
        filterTicket == other.filterTicket;
  }

  @override
  int get hashCode =>
      type.hashCode ^
      id.hashCode ^
      title.hashCode ^
      ticketOwnerType.hashCode ^
      key.hashCode ^
      filterTicket.hashCode;
}

/// generated route for
/// [_i35.TicketSaveScreen]
class TicketSaveRoute extends _i40.PageRouteInfo<TicketSaveRouteArgs> {
  TicketSaveRoute({
    _i41.Key? key,
    required String ticketId,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         TicketSaveRoute.name,
         args: TicketSaveRouteArgs(key: key, ticketId: ticketId),
         initialChildren: children,
       );

  static const String name = 'TicketSaveRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketSaveRouteArgs>();
      return _i35.TicketSaveScreen(key: args.key, ticketId: args.ticketId);
    },
  );
}

class TicketSaveRouteArgs {
  const TicketSaveRouteArgs({this.key, required this.ticketId});

  final _i41.Key? key;

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
/// [_i36.TicketsScreen]
class TicketsRoute extends _i40.PageRouteInfo<TicketsRouteArgs> {
  TicketsRoute({
    _i41.Key? key,
    required dynamic Function(_i42.TicketModel, _i42.TicketFilter) onTap,
    required List<_i42.TicketFilter> filters,
    String? subTitle,
    String? title,
    double? titleSize,
    _i55.CommonAppBar? appBar,
    List<_i40.PageRouteInfo>? children,
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

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketsRouteArgs>();
      return _i36.TicketsScreen(
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

  final _i41.Key? key;

  final dynamic Function(_i42.TicketModel, _i42.TicketFilter) onTap;

  final List<_i42.TicketFilter> filters;

  final String? subTitle;

  final String? title;

  final double? titleSize;

  final _i55.CommonAppBar? appBar;

  @override
  String toString() {
    return 'TicketsRouteArgs{key: $key, onTap: $onTap, filters: $filters, subTitle: $subTitle, title: $title, titleSize: $titleSize, appBar: $appBar}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TicketsRouteArgs) return false;
    return key == other.key &&
        const _i45.ListEquality().equals(filters, other.filters) &&
        subTitle == other.subTitle &&
        title == other.title &&
        titleSize == other.titleSize &&
        appBar == other.appBar;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i45.ListEquality().hash(filters) ^
      subTitle.hashCode ^
      title.hashCode ^
      titleSize.hashCode ^
      appBar.hashCode;
}

/// generated route for
/// [_i37.UserTicketManageScreen]
class UserTicketManageRoute
    extends _i40.PageRouteInfo<UserTicketManageRouteArgs> {
  UserTicketManageRoute({
    required _i42.TicketFilter ticketFilter,
    required String eventName,
    required String ticketId,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         UserTicketManageRoute.name,
         args: UserTicketManageRouteArgs(
           ticketFilter: ticketFilter,
           eventName: eventName,
           ticketId: ticketId,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'UserTicketManageRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserTicketManageRouteArgs>();
      return _i37.UserTicketManageScreen(
        ticketFilter: args.ticketFilter,
        eventName: args.eventName,
        ticketId: args.ticketId,
        key: args.key,
      );
    },
  );
}

class UserTicketManageRouteArgs {
  const UserTicketManageRouteArgs({
    required this.ticketFilter,
    required this.eventName,
    required this.ticketId,
    this.key,
  });

  final _i42.TicketFilter ticketFilter;

  final String eventName;

  final String ticketId;

  final _i41.Key? key;

  @override
  String toString() {
    return 'UserTicketManageRouteArgs{ticketFilter: $ticketFilter, eventName: $eventName, ticketId: $ticketId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserTicketManageRouteArgs) return false;
    return ticketFilter == other.ticketFilter &&
        eventName == other.eventName &&
        ticketId == other.ticketId &&
        key == other.key;
  }

  @override
  int get hashCode =>
      ticketFilter.hashCode ^
      eventName.hashCode ^
      ticketId.hashCode ^
      key.hashCode;
}

/// generated route for
/// [_i38.VenueHomeScreen]
class VenueHomeRoute extends _i40.PageRouteInfo<VenueHomeRouteArgs> {
  VenueHomeRoute({
    required String eventCode,
    _i41.Key? key,
    List<_i40.PageRouteInfo>? children,
  }) : super(
         VenueHomeRoute.name,
         args: VenueHomeRouteArgs(eventCode: eventCode, key: key),
         initialChildren: children,
       );

  static const String name = 'VenueHomeRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VenueHomeRouteArgs>();
      return _i38.VenueHomeScreen(eventCode: args.eventCode, key: args.key);
    },
  );
}

class VenueHomeRouteArgs {
  const VenueHomeRouteArgs({required this.eventCode, this.key});

  final String eventCode;

  final _i41.Key? key;

  @override
  String toString() {
    return 'VenueHomeRouteArgs{eventCode: $eventCode, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VenueHomeRouteArgs) return false;
    return eventCode == other.eventCode && key == other.key;
  }

  @override
  int get hashCode => eventCode.hashCode ^ key.hashCode;
}

/// generated route for
/// [_i39.VenueSplashScreen]
class VenueSplashRoute extends _i40.PageRouteInfo<void> {
  const VenueSplashRoute({List<_i40.PageRouteInfo>? children})
    : super(VenueSplashRoute.name, initialChildren: children);

  static const String name = 'VenueSplashRoute';

  static _i40.PageInfo page = _i40.PageInfo(
    name,
    builder: (data) {
      return const _i39.VenueSplashScreen();
    },
  );
}
