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
import 'package:mainland/core/component/button/common_button.dart';
import 'package:mainland/core/component/image/common_image.dart';
import 'package:mainland/core/component/other_widgets/common_draggable_bottom_sheet.dart';
import 'package:mainland/core/component/other_widgets/muiltiple_selector.dart';
import 'package:mainland/core/component/other_widgets/smart_list_loader.dart';
import 'package:mainland/core/component/pop_up/common_popup_menu.dart';
import 'package:mainland/core/component/text/common_text.dart';
import 'package:mainland/core/component/text_field/common_multiline_text_field.dart';
import 'package:mainland/core/component/text_field/common_text_field.dart';
import 'package:mainland/core/component/text_field/custom_form.dart';
import 'package:mainland/core/component/text_field/input_helper.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/route/app_router.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:mainland/core/utils/constants/app_text_styles.dart';
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
    appBar: _appBar(context),
    backgroundColor: AppColors.background,
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocProvider(
        create: (context) => ChatCubit(chatListItemModel.chatId)..fetch(),
        child: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            final cubit = context.read<ChatCubit>();
            return Column(
              children: [
                Expanded(
                  child: SmartListLoader(
                    isReverse: true,
                    onLoadMore: cubit.loadMore,
                    isLoading: state.isLoading,
                    itemCount: state.chats.length,
                    itemBuilder: (context, index) => _chatItem(state.chats[index], context),
                  ),
                ),
                CustomForm(
                  builder: (context, formKey) {
                    return SizedBox(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 20),
                          child: Column(
                            children: [
                              if (state.filePath.isNotEmpty) ...[
                                UploadFilesWidget(
                                  files: state.filePath,
                                  onRemove: cubit.removeFile,
                                ),
                                const Divider(color: Colors.white),
                              ],
                              CommonTextField(
                                hintText: AppString.typeYourMessage,
                                backgroundColor: AppColors.greay50,
                                suffixIcon: _suffix(cubit, formKey),
                                key: Key(state.message),
                                validationType: ValidationType.notRequired,
                                borderColor: AppColors.greay50,
                                onSaved: (value, controller) {
                                  cubit.onMessageChange(message: value);
                                  controller.text = '';
                                },
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
    ),
  );

  Row _suffix(ChatCubit cubit, GlobalKey<FormState> formKey) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: cubit.pickImage,
          child: Icon(Icons.attach_file, color: AppColors.greay500),
        ),
        2.width,
        GestureDetector(
          onTap: () => cubit.pickImage(isAttachment: false),
          child: Icon(Icons.image, color: AppColors.greay500),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          color: AppColors.greay500,
          width: 2.w,
          height: 20.h,
        ),
        GestureDetector(
          onTap: () {
            if (formKey.currentState?.validate() == true) {
              formKey.currentState?.save();
              cubit.send();
            }
          },
          child: Icon(Icons.send, color: AppColors.greay500),
        ),
        10.width,
      ],
    );
  }

  Widget _chatItem(ChatModel model, BuildContext context) {
    final bool isImageOnly = model.files?.isNotEmpty == true && model.content.isEmpty;
    final Color isMeBackground = AppColors.primaryColor;
    final Color isMeText = AppColors.textWhite;
    final bool isMe =
        model.userInfo.userId == context.read<AuthCubit>().state.userLoginInfoModel.id;
    return Column(
      children: [
        Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Card(
            color: isImageOnly
                ? null
                : (isMe ? isMeBackground : getTheme.dividerColor.withAlpha(20)),
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
                    if (model.content.isNotEmpty)
                      CommonText(
                        text: model.content,
                        color: isMe ? isMeText : null,
                        fontSize: 16.sp,
                      ),
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
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: CommonText(
            left: isMe ? 0 : 10.w,
            right: isMe ? 10.w : 0,
            text: Utils.formatDateTime(model.createdAt),
            color: AppColors.primaryText,
          ),
        ),
        10.height,
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
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
      actions: [
        CommonPopupMenu(
          showTextTrigger: false,
          onPrimaryColor: AppColors.primaryText,
          // primaryColor: AppColors.primaryColor,
          showIconTrigger: true,
          items: [AppString.report],
          onItemSelected: (value) {
            showModalBottomSheet(
              backgroundColor: AppColors.backgroundWhite,
              context: context,
              constraints: BoxConstraints(minWidth: double.infinity, maxHeight: 460.h),
              builder: (context) {
                return expandedContent();
              },
            );
          },
        ),
      ],
    );
  }

  Widget collapsedContent() {
    return CommonText(
      text: '${AppString.selectReasons}:',
      style: AppTextStyles.titleLarge?.copyWith(color: AppColors.primaryColor),
    );
  }

  Widget expandedContent() {
    final listOfReasons = [
      AppString.privacyConcerns,
      AppString.eroticContent,
      AppString.copyrightViolations,
      AppString.defamation,
      AppString.obscene,
      AppString.others,
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          10.height,
          collapsedContent(),
          SizedBox(
            height: 260.h,
            child: MultipleSelector(
              items: listOfReasons,

              selectedItems: [],
              onChange: (value) {},
              showSearch: false,
            ),
          ),
          CommonMultilineTextField(
            validationType: ValidationType.notRequired,
            borderColor: AppColors.white300,
            hintText: AppString.otherDetails,
            backgroundColor: AppColors.white300,
            height: 78.h,
            onSave: (p1) {},
          ).paddingSymmetric(horizontal: 16.w),
          10.height,
          CommonButton(titleText: AppString.report, onTap: () {}),
        ],
      ),
    );
  }
}
