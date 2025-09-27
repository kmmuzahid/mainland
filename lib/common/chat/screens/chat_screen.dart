// File: chat_screen.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/common/auth/cubit/auth_cubit.dart';
import 'package:mainland/common/chat/cubit/chat/chat_cubit.dart';
import 'package:mainland/common/chat/cubit/chat/chat_state.dart';
import 'package:mainland/common/chat/model/chat_list_item_model.dart';
import 'package:mainland/common/chat/model/chat_model.dart';
import 'package:mainland/common/chat/widgets/file_thumbnail_grid.dart';
import 'package:mainland/common/chat/widgets/upload_files_widget.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/other_widgets/smart_list_loader.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/custom_form.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  ChatScreen({required this.chatListItemModel, super.key, this.action})
    : chatIemWidth = (Utils.deviceSize.width - 32) * .7;
  final Widget? action;
  final double chatIemWidth;
  final ChatListItemModel chatListItemModel;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: _appBar(),
    body: BlocProvider(
      create: (context) => ChatCubit(chatListItemModel.chatId)..fetch(),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          final cubit = context.read<ChatCubit>();
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SmartListLoader(
                    isReverse: true,
                    onLoadMore: cubit.loadMore,
                    isLoading: state.isLoading,
                    itemCount: state.chats.length,
                    itemBuilder: (context, index) => _chatItem(state.chats[index], context),
                  ),
                ),
              ),
              CustomForm(
                builder: (context, formKey) {
                  return SizedBox(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 10),
                        child: Column(
                          children: [
                            if (state.filePath.isNotEmpty) ...[
                              UploadFilesWidget(files: state.filePath, onRemove: cubit.removeFile),
                              const Divider(color: Colors.white),
                            ],
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: getTheme.colorScheme.onSecondary,
                                    child: Column(
                                      children: [
                                        CommonTextField(
                                          key: Key(state.message),
                                          validationType: ValidationType.notRequired,
                                          borderColor: getTheme.colorScheme.onSecondary,
                                          onSaved: (value, controller) {
                                            cubit.onMessageChange(message: value);
                                            controller.text = '';
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: cubit.pickImage,
                                  child: const Icon(Icons.attach_file),
                                ),
                                10.width,
                                GestureDetector(
                                  onTap: () {
                                    if (formKey.currentState?.validate() == true) {
                                      formKey.currentState?.save();
                                      cubit.send();
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: getTheme.colorScheme.onSecondary,
                                    ),
                                    child: Icon(
                                      Icons.send,
                                      color: getTheme.textTheme.bodyLarge?.color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    ),
  );

  Widget _chatItem(ChatModel model, BuildContext context) {
    final bool isMe =
        model.userInfo.userId == context.read<AuthCubit>().state.userLoginInfoModel.id;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        color: isMe ? getTheme.colorScheme.outlineVariant : getTheme.dividerColor.withAlpha(20),
        child: SizedBox(
          width: chatIemWidth,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                if (model.files?.isNotEmpty == true)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: FileThumbnailGrid(files: model.files!),
                  ),
                if (model.content.isNotEmpty) Text(model.content),
                if (model.chatType == ChatType.callFailed)
                  Row(
                    children: [
                      Icon(
                        Icons.call_missed_rounded,
                        color: isMe
                            ? getTheme.textTheme.bodySmall?.color
                            : getTheme.colorScheme.error,
                      ),
                      CommonText(
                        text: 'Voice Call',
                        color: isMe
                            ? getTheme.textTheme.bodySmall?.color
                            : getTheme.colorScheme.error,
                      ),
                    ],
                  ),
                if (model.chatType == ChatType.callSuccess)
                  Row(
                    children: [
                      Icon(isMe ? Icons.call_made : Icons.call_received),
                      const CommonText(text: 'Voice Call'),
                    ],
                  ),
                CommonText(text: Utils.formatDateTime(model.createdAt)).end,
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: getTheme.colorScheme.outlineVariant,
      title: Row(
        children: [
          CommonImage(imageSrc: chatListItemModel.userImage, size: 29, borderRadius: 29),
          10.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(text: chatListItemModel.userName, style: getTheme.textTheme.titleSmall),
              CommonText(text: chatListItemModel.userStatus.displayName),
            ],
          ),
        ],
      ),
      leadingWidth: 40,
      leading: GestureDetector(
        onTap: appRouter.pop,
        child: const Padding(padding: EdgeInsets.only(left: 10), child: Icon(Icons.arrow_back_ios)),
      ),
      actionsPadding: const EdgeInsets.only(right: 10),
      titleSpacing: 0,
      actions: [],
    );
  }
}
