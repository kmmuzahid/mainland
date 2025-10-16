import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/event/cubit/event_details_cubit.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/mainlad/event_widget.dart';
import 'package:mainland/core/component/other_widgets/smart_staggered_loader.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/gen/assets.gen.dart';

@RoutePage()
class AllEventScreen extends StatelessWidget {
  const AllEventScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: title),
      body: SmartStaggeredLoader(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: 20,
        crossAxisSpacing: 10,
        aspectRatio: .6,
        mainAxisSpacing: 2,
        itemBuilder: (context, index) => EventWidget(
          image: Assets.images.sampleItem.path,
          onTap: () {
            appRouter.push(EventDetailsRoute(eventId: '1'));
          },
        ),
      ),
    );
  }
}
