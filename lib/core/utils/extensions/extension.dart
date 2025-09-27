import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as screenutil;
import 'package:intl/intl.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/log/app_log.dart';

ThemeData get getTheme => Theme.of(appRouter.globalRouterKey.currentContext!);

extension EnumDisplayName on Enum {
  String get displayName {
    final raw = name;
    final spaced = raw.replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(0)}');

    return spaced[0].toUpperCase() + spaced.substring(1);
  }
}

extension strting on String {
  String get newLine => '$this\n';
}

extension View on num {
  Widget get height => SizedBox(height: toDouble().h);

  Widget get width => SizedBox(width: toDouble().w);
}

// All Alignments Extensions

extension Alignments on Widget {
  Widget get start => Align(alignment: Alignment.centerLeft, child: this);

  Widget get end => Align(alignment: Alignment.centerRight, child: this);

  Widget get center => Align(child: this);
}

// All Alignments Time Formatter Extensions
extension TimeFormater on DateTime {
  String get time => DateFormat('h:mm a').format(this);

  String get date => DateFormat('dd-MM-yyyy').format(this);

  String get dayName => DateFormat('E').format(this);

  String get checkTime {
    final DateTime currentDateTime = DateTime.now();

    final Duration difference = currentDateTime.difference(this);
    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return ('${difference.inMinutes} minutes ago');
      } else {
        return ('${difference.inHours} hours ago');
      }
    } else {
      final createdAtTime = toIso8601String().split('.')[0];
      final date = createdAtTime.split('T')[0];
      final time = createdAtTime.split('T')[1];
      return '$date at $time';
    }
  }
}

extension AsyncTryCatch on Function() {
  Future<void> tryCatch() async {
    try {
      await this();
    } catch (e, stackTrace) {
      AppLogger.error(stackTrace.toString(), tag: 'Global Try Catch');
    }
  }
}

extension WidgetPaddingX on Widget {
  Widget paddingAll(double padding) => Padding(padding: EdgeInsets.all(padding), child: this);

  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) => Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    child: this,
  );

  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) => Padding(
    padding: EdgeInsets.only(top: top.w, left: left.w, right: right.w, bottom: bottom.w),
    child: this,
  );

  Widget get paddingZero => Padding(padding: EdgeInsets.zero, child: this);
}

/// Add margin property to widget
extension WidgetMarginX on Widget {
  Widget marginAll(double margin) => Container(margin: EdgeInsets.all(margin), child: this);

  Widget marginSymmetric({double horizontal = 0.0, double vertical = 0.0}) => Container(
    margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    child: this,
  );

  Widget marginOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) => Container(
    margin: EdgeInsets.only(top: top.w, left: left.w, right: right.w, bottom: bottom.w),
    child: this,
  );

  Widget get marginZero => Container(margin: EdgeInsets.zero, child: this);
}

/// Allows you to insert widgets inside a CustomScrollView
extension WidgetSliverBoxX on Widget {
  Widget get sliverBox => SliverToBoxAdapter(child: this);
}
