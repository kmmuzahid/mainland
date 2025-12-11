import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mainland/common/chat/model/chat_list_item_model.dart';
import 'package:mainland/common/chat/model/chat_model.dart';
import 'package:mainland/common/chat/repository/chat_repository.dart';
import 'package:mainland/core/config/api/api_end_point.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';
import 'package:mainland/core/config/network/dio_service.dart';
import 'package:mainland/core/config/network/request_input.dart';
import 'package:mainland/core/config/network/response_state.dart';
import 'package:mainland/core/config/socket/socket_message_model.dart';
import 'package:mainland/core/utils/app_utils.dart';
import 'package:mainland/core/utils/extensions/extension.dart';
import 'package:mainland/core/utils/helpers/simulate_moc_repo.dart';
import 'package:mainland/gen/assets.gen.dart';

import '../model/chat_user_info.dart';

class MockChatRepository implements ChatRepository {
  final DioService _dioService = getIt();
  @override
  Future<ResponseState<List<ChatListItemModel>?>> fetchChatList({required int page}) async {
    return _dioService.request(
      input: RequestInput(endpoint: ApiEndPoint.instance.chat, method: RequestMethod.GET),
      responseBuilder: (data) {
        if (data != null) {
          return (data as List)
              .map(
                (e) => ChatListItemModel(
                  chatId: e['id'],
                  userImage: e['photo'],
                  userStatus: UserStatus.online,
                  lastSendMessageTime: Utils.parseDate(e['lastMessageTime']) ?? DateTime.now(),
                  userName: e['name'] ?? '',
                  lastMessage: e['lastMessage'] ?? '',
                  isRead: e['lastMessageRead'] ?? false,
                ),
              )
              .toList();
        }
      },
    );
  }

  @override
  Future<ResponseState<List<ChatModel>?>> fetchChat({
    required int page,
    required String chatId,
  }) async {
    return _dioService.request(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.getMessages(chatId: chatId),
        queryParams: {'limit': 20, 'page': page},
        method: RequestMethod.GET,
      ),
      responseBuilder: (data) => (data as List).map((e) {
        final model = SocketMessageModel.fromJson(e);
        return ChatModel(
          messageId: model.id,
          chatType: ChatType.message,
          files: model.image,
          content: model.text,
          userInfo: ChatUserInfo(
            userId: model.ownerId ?? '',
            name: model.sender.name,
            image: model.sender.image,
          ),
          createdAt: model.createdAt ?? DateTime.now(),
        );
      }).toList(),
    );

  }

  @override
  Future<bool> sendMessage({
    required String chatId,
    required String message,
    required List<XFile>? file, // documents
    required List<XFile>? image,
  }) async {
    final result = await _dioService.request(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.sentMessage,
        method: RequestMethod.POST,

        files: {
          if (image?.isNotEmpty ?? false) 'image': image,
          // if (file?.isNotEmpty ?? false) 'document': file,
        },
        jsonBody: {'chatId': chatId, 'text': message},
      ),
      responseBuilder: (data) => data,
    );

    return result.isSuccess;
  }

  @override
  Future<ResponseState<List<ChatListItemModel>?>> searchChatList({
    required int page,
    required String keywords,
  }) {
    return _dioService.request(
      input: RequestInput(
        endpoint: ApiEndPoint.instance.chat,
        queryParams: {'search': keywords},
        method: RequestMethod.GET,
      ),
      responseBuilder: (data) {
        if (data != null) {
          return (data as List)
              .map(
                (e) => ChatListItemModel(
                  chatId: e['id'],
                  userImage: e['photo'],
                  userStatus: UserStatus.online,
                  lastSendMessageTime: Utils.parseDate(e['lastMessageTime']) ?? DateTime.now(),
                  userName: e['name'] ?? '',
                  lastMessage: e['lastMessage'] ?? '',
                  isRead: e['lastMessageRead'] ?? '',
                ),
              )
              .toList();
        }
      },
    );
  }
}
