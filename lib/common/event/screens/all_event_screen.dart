import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/mainlad/event_widget.dart';
import 'package:mainland/core/component/other_widgets/smart_staggered_loader.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';

@RoutePage()
class AllEventScreen extends StatelessWidget {
  const AllEventScreen({super.key, required this.title, this.onTap});

  final String title;
  final Function(String eventId, String title)? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Column(
        children: [
          CommonText(
            left: 20,
            bottom: 10,
            text: title,
            textColor: AppColors.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ).start,
          Expanded(
            child: SmartStaggeredLoader(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
              itemCount: 20,
              crossAxisSpacing: 10,
              aspectRatio: 0.6434,
              mainAxisSpacing: 10,
              isSeperated: true,
              itemBuilder: (context, index) => EventWidget(
                image: Assets.images.sampleItem.path,
                onTap: () {
                  if (onTap != null) {
                    onTap?.call(
                      '1',
                      'Juice WRLD Mon. Jan. 12, 8pm Eko Hotel & Suites Pre Order available Nov. 1',
                    );
                    return;
                  }
                  appRouter.push(EventDetailsRoute(eventId: '1'));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
