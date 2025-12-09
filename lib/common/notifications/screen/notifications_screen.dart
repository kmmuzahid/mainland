import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mainland/common/notifications/cubit/notification_cubit.dart';
import 'package:mainland/common/notifications/cubit/notification_state.dart';
import 'package:mainland/common/notifications/widgets/notification_item.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';
import 'package:mainland/core/component/other_widgets/smart_list_loader.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationCubit>().init();
    });
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        final cubit = context.read<NotificationCubit>();
        return Scaffold(
          appBar: CommonAppBar(title: AppString.notifications, onBackPress: cubit.cleanList),
          body: SmartListLoader(
            itemCount: state.notifications?.length ?? 0,
            isLoading: state.isLoading,
            onLoadMore: cubit.loadMore,
            onRefresh: cubit.fetch,
            itemBuilder: (context, index) => NotificationItem(item: state.notifications![index]),
          ),
        );
      },
    );
  }
}
