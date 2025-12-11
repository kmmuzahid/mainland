import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mainland/common/chat/model/chat_model.dart';
import 'package:mainland/common/chat/model/chat_user_info.dart';
import 'package:mainland/common/chat/repository/chat_repository.dart';
import 'package:mainland/core/component/other_widgets/permission_handler_helper.dart';
import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/languages/cubit/language_cubit.dart';
import 'package:mainland/core/config/socket/socket_message_model.dart';
import 'package:mainland/core/config/socket/socket_service.dart';
import 'package:mainland/core/config/socket/stream_data_model.dart';
import 'package:mainland/core/utils/log/app_log.dart';
import 'package:mainland/main.dart';
import 'package:permission_handler/permission_handler.dart';

import 'chat_state.dart';

class ChatCubit extends SafeCubit<ChatState> {
  ChatCubit(this.chatId) : super(const ChatState());
  final String chatId;

  final ChatRepository _repository = getIt();
  final FilePicker _picker = FilePicker.platform;
  final ImagePicker _imagePicker = ImagePicker();
  late StreamSubscription<StreamDataModel> _subscriptions;

  int? _getPageNo(List responce) => responce.isNotEmpty ? state.pageNo + 1 : null;

  void init() async {
    _subscriptions = SocketService.instance.streamController.stream.listen((data) {
      if (data.streamType == StreamType.message) {
        final model = data.data as SocketMessageModel;
        emit(
          state.copyWith(
            chats: [
              ChatModel(
                messageId: model.id,
                chatType: ChatType.message,
                content: model.text,
                files: model.image,
                userInfo: ChatUserInfo(
                  userId: model.ownerId ?? '',
                  name: model.sender.name,
                  image: model.sender.image,
                ),
                createdAt: model.createdAt ?? DateTime.now(),
              ),
              ...state.chats,
            ],
          ),
        );
      }
    });
    fetch();
  }

  Future<void> fetch() async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true, chats: [], pageNo: 1));
    final responce = await _repository.fetchChat(page: 1, chatId: chatId);
    emit(
      state.copyWith(
        chats: responce.data,
        isLoading: false,
        pageNo: _getPageNo(responce.data ?? []),
      ),
    );
  }

  Future<void> loadMore() async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final responce = await _repository.fetchChat(page: state.pageNo, chatId: chatId);
    AppLogger.debug(responce.data.toString());
    emit(
      state.copyWith(
        isLoading: false,
        chats: [...state.chats, ...responce.data ?? []],
        pageNo: _getPageNo(responce.data ?? []),
      ),
    );
  }

  Future<void> send({required String userId}) async {
    final chat = ChatModel(
      messageId: DateTime.now().millisecondsSinceEpoch.toString(),
      isSending: true,
      chatType: ChatType.message,
      content: state.message,
      files: state.filePath.map((e) => e.path).toList(),
      userInfo: ChatUserInfo(userId: userId, name: '', image: ''),
      createdAt: DateTime.now(),
    );
    final files = state.filePath;
    final messge = state.message;
    emit(state.copyWith(chats: [chat, ...state.chats], filePath: [], message: ''));
    final result = await _repository.sendMessage(
      message: messge, chatId: chatId, rowFiles: files,
    );
    if (result) {
      final list = List.from(state.chats);
      final index = state.chats.indexWhere((e) => e.messageId == chat.messageId);
      list.removeAt(index);
      emit(state.copyWith(chats: [...list]));
    } else {
      emit(state.copyWith(chats: [chat.copyWith(isSendingFaild: true), ...state.chats]));
    }
  }

  Future<void> onMessageChange({required String message}) async {
    emit(state.copyWith(message: message));
  }

  Future<void> pickImage({bool isAttachment = true}) async {
    if (isAttachment) {
      await const PermissionHandlerHelper(permission: Permission.storage).getStatus();
      final pickedFile = await _picker.pickFiles(allowMultiple: true);
      List<XFile> files = pickedFile?.files.map((e) => e.xFile).toList() ?? [];
      if (files.length > 9) {
        files = files.sublist(0, 9);
        showSnackBar(AppString.maximumFileSelection(9), type: SnackBarType.warning);
      }

      emit(state.copyWith(filePath: files));
    } else {
      await const PermissionHandlerHelper(permission: Permission.photos).getStatus();
      final pickedFile = await _imagePicker.pickMultiImage(limit: 9);
      List<XFile> files = pickedFile.map((e) => XFile(e.path)).toList();
      if (files.length > 9) {
        files = files.sublist(0, 9);
        showSnackBar(AppString.maximumFileSelection(9), type: SnackBarType.warning);
      }
      emit(state.copyWith(filePath: files));
    }
  }

  Future<void> removeFile(int index) async {
    final updatedList = List.of(state.filePath);
    updatedList.removeAt(index);
    emit(state.copyWith(filePath: updatedList));
  }

  @override
  Future<void> close() {
    _subscriptions.cancel();
    return super.close();
  }
}
