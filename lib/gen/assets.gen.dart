// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/appIcon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/icon/appIcon.png');

  /// File path: assets/icon/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/icon/icon.png');

  /// File path: assets/icon/launcherIcon.png
  AssetGenImage get launcherIcon =>
      const AssetGenImage('assets/icon/launcherIcon.png');

  /// File path: assets/icon/venue_icon.png
  AssetGenImage get venueIcon =>
      const AssetGenImage('assets/icon/venue_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [appIcon, icon, launcherIcon, venueIcon];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/account_banner.png
  AssetGenImage get accountBanner =>
      const AssetGenImage('assets/images/account_banner.png');

  /// File path: assets/images/apple_wallet.png
  AssetGenImage get appleWallet =>
      const AssetGenImage('assets/images/apple_wallet.png');

  /// File path: assets/images/english.png
  AssetGenImage get english => const AssetGenImage('assets/images/english.png');

  /// File path: assets/images/google_wallet.png
  AssetGenImage get googleWallet =>
      const AssetGenImage('assets/images/google_wallet.png');

  /// File path: assets/images/locationSampleMap.png
  AssetGenImage get locationSampleMap =>
      const AssetGenImage('assets/images/locationSampleMap.png');

  /// File path: assets/images/nav_account.png
  AssetGenImage get navAccount =>
      const AssetGenImage('assets/images/nav_account.png');

  /// File path: assets/images/nav_chat.png
  AssetGenImage get navChat =>
      const AssetGenImage('assets/images/nav_chat.png');

  /// File path: assets/images/nav_fanClub.png
  AssetGenImage get navFanClub =>
      const AssetGenImage('assets/images/nav_fanClub.png');

  /// File path: assets/images/nav_favorite.png
  AssetGenImage get navFavorite =>
      const AssetGenImage('assets/images/nav_favorite.png');

  /// File path: assets/images/nav_home.png
  AssetGenImage get navHome =>
      const AssetGenImage('assets/images/nav_home.png');

  /// File path: assets/images/nav_ticket.png
  AssetGenImage get navTicket =>
      const AssetGenImage('assets/images/nav_ticket.png');

  /// File path: assets/images/preference_icon.png
  AssetGenImage get preferenceIcon =>
      const AssetGenImage('assets/images/preference_icon.png');

  /// File path: assets/images/sampleItem.png
  AssetGenImage get sampleItem =>
      const AssetGenImage('assets/images/sampleItem.png');

  /// File path: assets/images/sampleItem_2.jpg
  AssetGenImage get sampleItem2 =>
      const AssetGenImage('assets/images/sampleItem_2.jpg');

  /// File path: assets/images/sampleItem_3.png
  AssetGenImage get sampleItem3 =>
      const AssetGenImage('assets/images/sampleItem_3.png');

  /// File path: assets/images/sample_qr.png
  AssetGenImage get sampleQr =>
      const AssetGenImage('assets/images/sample_qr.png');

  /// File path: assets/images/us_flag.png
  AssetGenImage get usFlag => const AssetGenImage('assets/images/us_flag.png');

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// File path: assets/images/venue_history.png
  AssetGenImage get venueHistory =>
      const AssetGenImage('assets/images/venue_history.png');

  /// File path: assets/images/venue_home.png
  AssetGenImage get venueHome =>
      const AssetGenImage('assets/images/venue_home.png');

  /// File path: assets/images/venue_setting.png
  AssetGenImage get venueSetting =>
      const AssetGenImage('assets/images/venue_setting.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    accountBanner,
    appleWallet,
    english,
    googleWallet,
    locationSampleMap,
    navAccount,
    navChat,
    navFanClub,
    navFavorite,
    navHome,
    navTicket,
    preferenceIcon,
    sampleItem,
    sampleItem2,
    sampleItem3,
    sampleQr,
    usFlag,
    user,
    venueHistory,
    venueHome,
    venueSetting,
  ];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
