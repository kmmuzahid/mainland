import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/home/bloc/home_cubit.dart';
import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/common/tickets/widgets/ticket_widget.dart';
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/common/home/widgets/home_top_widget.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/bloc/cubit_scope.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/gen/assets.gen.dart';
import 'package:mainland/user/home/cubit/user_home_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key, required this.homeState});
  final HomeState homeState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 12.h),
        child: CubitScope(
          create: () => UserHomeCubit()..fetch(),
          builder: (context, cubit, state) => RefreshIndicator(
            onRefresh: () => cubit.fetch(isRefresh: true),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _topChild(context: context),
                  10.height,
                  CommonTextField(
                    backgroundColor: AppColors.backgroundWhite,
                    prefixIcon: const Icon(Icons.search),
                    hintText: AppString.searchEventsHere,
                    validationType: ValidationType.notRequired,
                  ),
                  10.height,
                  _header(
                    title: AppString.newlyAddedEvents,
                    onTap: () {
                      appRouter.push(
                        AllEventRoute(
                          title: AppString.newlyAddedEvents,
                          ticketFilter: TicketFilter.newlyAdded,
                        ),
                      );
                    },
                  ),
                  10.height,
                  _suggestions(data: state.newlyAddedEvents, isLoading: state.isNewlyAddedLoading),
                  Divider(color: AppColors.outlineColor),
                  _header(
                    title: AppString.popularEvents,
                    onTap: () {
                      appRouter.push(
                        AllEventRoute(
                          title: AppString.popularEvents,
                          ticketFilter: TicketFilter.popular,
                        ),
                      );
                    },
                  ),
                  10.height,
                  _suggestions(data: state.popularEvents, isLoading: state.isPopularLoading),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _header({required Function() onTap, required String title}) {
    return Row(
      children: [
        CommonText(text: title, style: AppTextStyles.titleLarge),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: CommonText(
            text: AppString.seeMore,
            style: AppTextStyles.titleMedium?.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }

  Widget _suggestions({required List<TicketModel> data, required bool isLoading}) {
    return Skeletonizer(
      enabled: isLoading,
      child: SizedBox(
      height: 272.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: isLoading || data.isEmpty ? 3 : data.length,
          itemBuilder: (context, index) {
            if (isLoading || data.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: AspectRatio(
                  aspectRatio: 0.6434,
                  child: Skeleton.leaf(
                    enabled: isLoading,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              );
            }

            final ticket = data[index];
            return Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: AspectRatio(
                aspectRatio: 0.6434,
                child: TicketWidget(
                  ticketModel: ticket,
                  onTap: () {
                    appRouter.push(EventDetailsRoute(eventId: ticket.id ?? ''));
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }


  Widget _topChild({required BuildContext context}) {
    final authState = context.watch<AuthCubit>().state;
    return HomeTopWidget(
      state: homeState,
      startWidget: GestureDetector(
        onTap: () {
          // navigate to account screen.
          appRouter.push(SettingRoute(showBackButton: true));
        },
        child: CommonImage(
          imageSrc: authState.profileModel?.image ?? Assets.images.user.path,
          size: 36,
          borderRadius: 8,
        ),
      ),
      middleWidget: CommonButton(
        borderColor: AppColors.iconColorBlack.withValues(alpha: .6),
        titleColor: AppColors.primaryColor,
        buttonRadius: 12,
        buttonColor: AppColors.transparent,
        titleText: AppString.categories,
        onTap: () {
          appRouter.push(
            PreferenceRoute(
              includeSelectedSubcategory: false,
              backgroundColor: AppColors.background,
              header: Row(
                children: [
                  CommonText(
                    text: 'Filter Event',
                    textAlign: TextAlign.left,
                    alignment: MainAxisAlignment.start,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.primaryColor,
                  ),
                ],
              ),
              onSubscategoryTap: (category, subCategory) {
                appRouter.push(AllEventRoute(title: subCategory.title));
              },
            ),
          );
        },
      ),
    );
  }
}
