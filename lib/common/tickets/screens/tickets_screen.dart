import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/tickets/cubit/tickets_cubit.dart';
import 'package:mainland/common/tickets/cubit/tickets_state.dart';
import 'package:mainland/common/tickets/model/ticket_model.dart';
import 'package:mainland/common/tickets/widgets/ticket_filter_widget.dart';
import 'package:mainland/common/tickets/widgets/ticket_widget.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/mainlad/event_widget.dart';
import 'package:mainland/core/component/other_widgets/smart_staggered_loader.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/utils/grid_child_postion.dart';
import 'package:mainland/core/utils/log/app_log.dart';

@RoutePage()
class TicketsScreen extends StatelessWidget {
  const TicketsScreen({
    super.key,
    required this.onTap,
    required this.filters,
    this.subTitle,
    this.title,
    this.titleSize,
    this.appBar,
  });
  final Function(String ticketId, TicketFilter ticketFilter) onTap;
  final List<TicketFilter> filters;
  final String? subTitle;
  final String? title;
  final double? titleSize;
  final CommonAppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocProvider(
            create: (context) => TicketsCubit()..initalize(filters.first),
            child: BlocBuilder<TicketsCubit, TicketsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    if (appBar == null) 20.height,
                    CommonText(
                      text: title ?? AppString.tickets,
                      style: AppTextStyles.headlineSmall,
                      fontSize: titleSize,
                      textColor: AppColors.primaryColor,
                    ).start,
                    if (subTitle != null)
                      CommonText(
                        text: subTitle!,
                        style: AppTextStyles.bodyMedium,
                      ).start,
                    10.height,
                    if (filters.length > 1)
                      TicketFilterWidget(
                        filters: filters,
                        selectedFilter: state.selectedFilter,
                        onTap: (filter) {
                          context.read<TicketsCubit>().filter(filter);
                        },
                      ),
                    10.height,
                    Expanded(
                      child: SmartStaggeredLoader(
                        itemCount: 20,
                        aspectRatio: 0.6434,
                        isSeperated: true,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        itemBuilder: (context, index) {
                          final ticket = state.tickets[index];
                          return TicketWidget(
                            filter: state.selectedFilter,
                            image: ticket.image,
                            title: ticket.title,
                            onTap: () {
                              onTap(ticket.eventId, state.selectedFilter!);
                            },
                          );
                        },
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
}
