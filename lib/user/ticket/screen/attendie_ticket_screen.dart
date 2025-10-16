import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/user/ticket/screen/ticket_checkout_screen.dart';
import 'package:mainland/user/ticket/widgets/ticket_picker.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';

@RoutePage()
class AttendieTicketScreen extends StatelessWidget {
  const AttendieTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonButton(
                titleText: AppString.next,
                onTap: () {
                  appRouter.push(TicketCheckoutRoute(type: TicketCheckoutType.attendee));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
