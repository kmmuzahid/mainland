// File: home_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/auth/model/user_login_info_model.dart';
import 'package:mainland/common/chat/screens/chat_list_screen.dart';
import 'package:mainland/common/home/bloc/home_cubit.dart';
import 'package:mainland/common/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:mainland/common/tickets/screens/tickets_screen.dart';
import 'package:mainland/common/tickets/widgets/ticket_filter_widget.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/organizer/home/screens/org_home.dart';
import 'package:mainland/user/fanclub/screens/fan_club_screen.dart';
import 'package:mainland/user/home/screens/user_home.dart';

//  AutoRoute(page: HomeRoute.page),

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

//user page list
  List<Widget> userPagesList() => [
    const UserHome(),

    TicketsScreen(
      onTap: (ticketId, ticketFilter) {
        appRouter.push(UserTicketManageRoute(ticketId: ticketId, ticketFilter: ticketFilter));
      },
      filters: const [
        TicketFilter.Live,
        TicketFilter.Available,
        TicketFilter.Sold,
        TicketFilter.Expired,
      ],
      title: AppString.liveAvailableForSaleSoldAndExpired,
    ),
    const FanClubScreen(),

    TicketsScreen(
      onTap: (ticketId, ticketFilter) {
        appRouter.push(TicketSaveRoute(ticketId: ticketId));
      },
      filters: const [TicketFilter.Upcoming, TicketFilter.Used],
      title: AppString.allAvailableTickets,
    ),
    const ChatListScreen(),
  ];

//organizer page list
  List<Widget> oranizerPageList() => [
    const OrgHome(),
    TicketsScreen(
      onTap: (ticketId, ticketFilter) {
        appRouter.push(TicketSaveRoute(ticketId: ticketId));
      },
      filters: const [
        TicketFilter.Live,
        TicketFilter.UnderReview,
        TicketFilter.Draft,
        TicketFilter.Closed,
      ],
      title: AppString.liveUnderReviewDraftAndClosedTickets,
    ),
    UserHome(),
    const ChatListScreen(),
  ];

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => HomeCubit(),
    child: AnnotatedRegion(
      value: const SystemUiOverlayStyle(systemStatusBarContrastEnforced: true),  
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return IndexedStack(
                index: state.currentIndex,
                children: context.read<AuthCubit>().state.userLoginInfoModel.role == Role.ORGANIZER
                    ? oranizerPageList()
                    : userPagesList(),
              );
            },
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    ),
  );
}
