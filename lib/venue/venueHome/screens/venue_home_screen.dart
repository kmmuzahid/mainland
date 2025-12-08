import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mainland/core/config/bloc/cubit_scope.dart';
import 'package:mainland/core/config/bloc/cubit_scope_value.dart';
import 'package:mainland/venue/venueHome/cubit/venue_cubit.dart';
import 'package:mainland/venue/venueHome/widgets/venue_setting_widget.dart';

import '../widgets/venue_bottom_navigation.dart';
import '../widgets/venue_history_widget.dart';
import '../widgets/venue_home_widget.dart';

@RoutePage()
class VenueHomeScreen extends StatelessWidget {
  const VenueHomeScreen({required this.eventCode, super.key});
  final String eventCode;
  @override
  Widget build(BuildContext context) {
    return CubitScope(
      create: () => VenueCubit()..init(eventCode: eventCode),
      builder: (context, cubit, state) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: IndexedStack(
              index: state.currentIndex,
              children: [
                VenueHomeWidget(cubit: cubit, state: state),
                VenueHistoryWidget(cubit: cubit, state: state),
                VenueSettingWidget(cubit: cubit),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const VenueBottomNavigationBar(),
      ),
    );
  }
}
