// File: chat_repository.dart
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mainland/common/chat/model/chat_list_item_model.dart';
import 'package:mainland/common/chat/model/chat_model.dart';
import 'package:mainland/core/config/network/response_state.dart';

abstract class ChatRepository {
  Future<ResponseState<List<ChatListItemModel>?>> fetchChatList({required int page});
  Future<ResponseState<List<ChatListItemModel>?>> searchChatList({
    required int page,
    required String keywords,
  });
  Future<ResponseState<List<ChatModel>?>> fetchChat({required int page, required String chatId});
  Future<bool> sendMessage({
    required String chatId,
    required String message, 
    required List<XFile>? rowFiles,  
  });


}
