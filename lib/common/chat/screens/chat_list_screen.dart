import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/app_bar/common_app_bar.dart';

import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/other_widgets/smart_list_loader.dart';
import 'package:mainland/core/component/pop_up/common_popup_menu.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/config/route/app_router.gr.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import '../cubit/chat_list/chat_list_cubit.dart';
import '../cubit/chat_list/chat_list_state.dart';
import '../model/chat_list_item_model.dart';

@RoutePage()
class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: AppString.message),
    body: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: BlocProvider(
        create: (context) => ChatListCubit()..fetch(),
        child: BlocBuilder<ChatListCubit, ChatListState>(
          builder: (context, state) {
            final cubit = context.read<ChatListCubit>();
            return SmartListLoader(
              itemCount: state.chatListItems.length,
              isLoading: state.isLoading,
              onLoadMore: cubit.loadMore,
              onRefresh: cubit.fetch,
              itemBuilder: (context, index) {
                final chatListItem = state.chatListItems[index];
                return GestureDetector(
                  onTap: () {
                    appRouter.push(ChatRoute(chatListItemModel: chatListItem));
                  },
                  child: Card(color: AppColors.serfeceBG, child: _chatItem(chatListItem)),
                );
              },
            );
          },
        ),
      ),
    ),
  );

  Widget _chatItem(ChatListItemModel chatListItem) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Stack(
            children: [
              CommonImage(imageSrc: chatListItem.userImage, size: 40, borderRadius: 30),
              _buildOnlineIcon(40, chatListItem.userStatus),
            ],
          ),
          10.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: chatListItem.userName,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryText,
              ),
              SizedBox(
                width: 220.w,
                child: CommonText(
                  text: chatListItem.lastMessage,
                  maxLines: 1,
                  style: TextStyle(
                    color: chatListItem.isRead ? AppColors.disable : AppColors.primaryText,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CommonPopupMenu(
                showTextTrigger: false,
                showIconTrigger: true,
                items: [AppString.deleteUser, AppString.blockUser],
                icons: const [Icons.delete_outline, Icons.block_outlined],
                onItemSelected: (value) {
                  if (value == AppString.deleteUser) {
                    //delete user
                  } else if (value == AppString.blockUser) {
                    //block user
                  }
                },
              ),
              CommonText(
                text: Utils.formatTime(chatListItem.lastSendMessageTime),
                color: AppColors.disable,
                right: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOnlineIcon(double width, UserStatus userStatus) {
    double right = 8;
    double bottom = 8;
    final radius = width / 2;
    final offset = radius * 0.02;
    right = offset;
    bottom = offset;

    return Positioned(
      bottom: bottom,
      right: right,
      child: Container(
        height: 8.w,
        width: 8.w,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: userStatus == UserStatus.online ? Colors.green : Colors.amber,
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
