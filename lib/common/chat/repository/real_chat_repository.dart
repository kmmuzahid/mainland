import 'dart:io';

import 'package:mainland/common/chat/model/chat_list_item_model.dart';
import 'package:mainland/common/chat/model/chat_model.dart';
import 'package:mainland/common/chat/repository/chat_repository.dart';
import 'package:mainland/core/config/network/response_state.dart';
import 'package:file_picker/file_picker.dart';

class RealChatRepository implements ChatRepository {
  @override
  Future<ResponseState<List<ChatModel>>> fetchChat({required int page, required String chatId}) {
    // TODO: implement fetchChat
    throw UnimplementedError();
  }

  @override
  Future<ResponseState<List<ChatListItemModel>>> fetchChatList({required int page}) {
    // TODO: implement fetchChatList
    throw UnimplementedError();
  }

  @override
  Future<bool> sendMessage({
    required String message,
    required String chatId,
    required String userId,
    List<PlatformFile>? file,
  }) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}
