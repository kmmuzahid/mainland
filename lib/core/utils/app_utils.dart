import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/auth/cubit/auth_state.dart';
import 'package:mainland/common/auth/model/user_login_info_model.dart';
import 'package:mainland/core/config/route/app_router.dart';

class Utils {
  static late Size deviceSize;

  static Role? getRole() =>
      appRouter.navigatorKey.currentState!.context.read<AuthCubit>().state.userLoginInfoModel.role;
  


  static String formatDateTimeToHms(DateTime dateTime) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    final seconds = dateTime.second.toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }

  static String formatDurationToHms(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }

  static String formatTime(DateTime time) {
    return DateFormat.jm().format(time); // 'jm' = e.g., 8:00 PM
  }

  static String formatDateToShortMonth(DateTime dateTime) {
    const List<String> monthAbbr = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final String day = dateTime.day.toString().padLeft(2, '0');
    final String month = monthAbbr[dateTime.month - 1];
    final String year = dateTime.year.toString();

    return '$day $month $year';
  }

  static String formatDateTime(DateTime dateTime) {
    final dateFormat = DateFormat('MMMM d, h:mm a');
    return dateFormat.format(dateTime);
  }

  static String formatDouble(double value) {
    final double rounded = double.parse(value.toStringAsFixed(1));
    if (rounded == rounded.toInt()) {
      return rounded.toInt().toString();
    } else {
      return rounded.toStringAsFixed(1);
    }
  }
}
