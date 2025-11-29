import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/common/tickets/widgets/ticket_widget.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/mainlad/event_widget.dart';
import 'package:mainland/core/component/other_widgets/smart_staggered_loader.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';

class FanClubScreen extends StatelessWidget {
  const FanClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            20.height,
            Row(
              children: [
                CommonText(
                  text: AppString.fanClub,
                  style: AppTextStyles.headlineSmall,
                  textColor: AppColors.primaryColor,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    appRouter.push(
                      PreferenceRoute(
                        successRoute: const HomeRoute(),
                        backgroundColor: AppColors.background,
                        buttonTitle: AppString.save,
                        header: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonText(
                              text: AppString.fanClub,
                              style: AppTextStyles.headlineSmall,
                              textColor: AppColors.primaryColor,
                            ).start,
                            CommonText(
                              text: AppString.chooseYourFavorites,
                              style: AppTextStyles.bodyLarge,
                            ).start,
                          ],
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.add, color: AppColors.iconColorBlack, size: 30),
                ),
                IconButton(
                  onPressed: () {
                    appRouter.push(const ModifyFavoriteFanClub());
                  },
                  icon: Icon(Icons.edit_outlined, color: AppColors.iconColorBlack, size: 25),
                ),
              ],
            ),
            CommonText(
              text: AppString.showingYourFavoriteEvent,
              style: AppTextStyles.bodyLarge,
            ).start,
            10.height,
            Expanded(
              child: SmartStaggeredLoader(
                itemCount: 20,
                crossAxisSpacing: 10,
                aspectRatio: 0.6434,
                isSeperated: true,
                mainAxisSpacing: 10,
                itemBuilder: (context, index) => TicketWidget(
                  ticketModel: TicketModel(),
                  onTap: () {
                    appRouter.push(EventDetailsRoute(eventId: '1'));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
