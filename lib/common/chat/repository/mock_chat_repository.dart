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
import 'package:mainland/core/utils/app_utils.dart';
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
                  userName: e['name'],
                  lastMessage: e['lastMessage'],
                  isRead: e['lastMessageRead'],
                ),
              )
              .toList();
        }
      },
    );
  }

  @override
  Future<ResponseState<List<ChatModel>>> fetchChat({
    required int page,
    required String chatId,
  }) async {
    final list = generateMockList(
      builder: (index) {
        return ChatModel(
          chatId: 'chatId',
          chatType: ChatType.message,
          files: index == 2 ? [Assets.images.sampleItem.path, Assets.images.sampleItem2.path] : [],
          content:
              'Hello! I’m interested in the navy blue two-piece suit you posted. Is it still available in size 52?',
          userInfo: ChatUserInfo(
            userId: index % 2 == 0 ? '' : 'userId',
            name: 'Cameron Williamson',
            image: Assets.images.sampleItem2.path,
          ),
          createdAt: DateTime.now(),
        );
      },
    );
    await SimulateMocRepo();
    return ResponseState(data: [...list, ...list], isSuccess: true, statusCode: 200);
  }

  @override
  Future<bool> sendMessage({
    required String message,
    required String chatId,
    required String userId,
    List<XFile>? file,
  }) async {
    await SimulateMocRepo();
    return true;
  }
}
