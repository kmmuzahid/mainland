import 'package:auto_route/auto_route.dart' show RoutePage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/model/user_login_info_model.dart';
import 'package:mainland/common/chat/model/chat_list_item_model.dart';
import 'package:mainland/common/event/cubit/event_details_cubit.dart';
import 'package:mainland/common/event/cubit/event_details_state.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';
import 'package:mainland/user/ticket/model/ticket_picker_model.dart';
import 'package:mainland/user/ticket/screen/ticket_checkout_screen.dart';

@RoutePage()
class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({
    required this.eventId,
    super.key,
    this.showEventActions = true,
    this.isEventAvailable = true,
    this.isEventUnderReview = false,
    this.details,
    this.image,
  });

  final String eventId;
  final bool showEventActions;
  final bool isEventAvailable;
  final bool isEventUnderReview;
  final String? details;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final showButton = showEventActions == false ? false : Utils.getRole() == Role.ATTENDEE;
    final String title =
        '''Juice WRLD Mon. Jan. 12, 8pm Eko Hotel & Suites Pre Order available Nov. 1''';
    return Scaffold(
      appBar: CommonAppBar(
        actions: [
          IconButton(
            onPressed: appRouter.pop,
            icon: Icon(Icons.ios_share_outlined, color: AppColors.primaryColor),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocProvider(
            create: (context) => EventDetailsCubit(),
            child: BlocBuilder<EventDetailsCubit, EventDetailsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    if (state.showDetails)
                      SizedBox(
                        height: 60.h,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<EventDetailsCubit>().showDetails(false);
                              },
                              child: CommonText(
                                top: 5,
                                text: AppString.moreMinus,
                                style: AppTextStyles.titleLarge?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: 24.sp,
                                ),
                              ).start,
                            ),
                            Utils.divider(),
                          ],
                        ),
                      ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: AnimatedCrossFade(
                          duration: const Duration(milliseconds: 300),
                          sizeCurve: Curves.easeInToLinear,
                          firstChild: _firstChild(title, context, showButton),
                          secondChild: _scondChild(context, state, showButton),
                          crossFadeState: state.showDetails
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _scondChild(BuildContext context, EventDetailsState state, bool showButton) {
    return Column(
      children: [
        CommonText(text: details ?? state.details, isDescription: true, textAlign: TextAlign.left),
        10.height,
        if (showButton) Divider(color: AppColors.disable, thickness: 2),
        10.height,
        if (showButton)
          Padding(
            padding: EdgeInsets.only(bottom: 50.h),
            child: _buttons(),
          ),
      ],
    );
  }

  Column _firstChild(String title, BuildContext context, bool showButton) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 0.562499994567678,
          child: Stack(
            children: [
              Positioned.fill(
                child: CommonImage(
                  imageSrc: image ?? Assets.images.sampleItem.path,
                  enableGrayscale: !isEventAvailable,
                  borderRadius: 12,
                ),
              ),

              if (isEventAvailable)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryText.withValues(alpha: isEventAvailable ? .5 : 1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),

              Positioned(
                left: 10.w,
                top: 30.h,
                width: Utils.deviceSize.width * .5,
                child: CommonText(
                  text: title,
                  maxLines: 10,
                  autoResize: false,
                  textAlign: TextAlign.left,
                  style: AppTextStyles.titleLarge?.copyWith(
                    color: AppColors.textWhite,
                    fontSize: 22.sp,
                  ),
                ),
              ),
              if (isEventUnderReview)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CommonText(
                    left: 10.w,
                    right: 10.w,
                    bottom: 20.w,
                    text: AppString.yourEventIsUnderReview,
                    style: AppTextStyles.titleLarge,
                    textColor: AppColors.textWhite,
                    fontSize: 20,
                  ),
                ),
              if (showButton) Positioned(left: 0, right: 0, bottom: 50.h, child: _buttons()),
            ],
          ),
        ),

        GestureDetector(
          onTap: () {
            context.read<EventDetailsCubit>().showDetails(true);
          },
          child: CommonText(
            left: 10,
            top: 5,
            text: AppString.morePlus,
            style: AppTextStyles.titleLarge?.copyWith(
              color: AppColors.primaryColor,
              fontSize: 24.sp,
            ),
          ).start,
        ),
        Utils.divider(),
      ],
    );
  }

  Widget _buttons() {
    return Column(
      children: [
        CommonButton(
          buttonWidth: 250,
          titleText: AppString.getOrganizerTicket,
          borderColor: AppColors.primaryColor,
          onTap: () {
            appRouter.push(TicketPurchaseRoute(type: TicketOwnerType.organizer));
          },
        ),
        10.height,
        CommonButton(
          buttonWidth: 250,
          titleText: AppString.viewAttendeeTickets,
          borderColor: AppColors.primaryColor,
          onTap: () {
            appRouter.push(const AttendieTicketAvailablityRoute());
          },
        ),
        10.height,
        CommonButton(
          buttonWidth: 250,
          titleText: AppString.messageOrganizer,
          borderColor: AppColors.primaryColor,
          onTap: () {
            appRouter.push(
              ChatRoute(
                chatListItemModel: ChatListItemModel(
                  chatId: '',
                  userImage: Assets.images.sampleItem3.path,
                  userName: 'Organizer XYZ',
                  userStatus: UserStatus.online,
                  lastSendMessageTime: DateTime.now(),
                  lastMessage: '',
                  isRead: false,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
