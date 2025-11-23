import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mainland/common/chat/model/chat_list_item_model.dart';
import 'package:mainland/common/chat/model/chat_model.dart';
import 'package:mainland/common/chat/repository/chat_repository.dart';
import 'package:mainland/core/config/network/response_state.dart';
import 'package:mainland/core/utils/helpers/simulate_moc_repo.dart';
import 'package:mainland/gen/assets.gen.dart';

import '../model/chat_user_info.dart';

class MockChatRepository implements ChatRepository {
  @override
  Future<ResponseState<List<ChatListItemModel>>> fetchChatList({required int page}) async {
    final list = generateMockList(
      builder: (index) {
        return ChatListItemModel(
          chatId: 'messageId',
          userImage: index % 2 == 0
              ? Assets.images.sampleItem.path
              : Assets.images.sampleItem2.path,
          userStatus: index % 2 == 0 ? UserStatus.offline : UserStatus.online,
          lastSendMessageTime: DateTime.now(),
          userName: 'Cameron Williamson $index',
          lastMessage:
              'Hello! I’m interested in the navy blue two-piece suit you posted. Is it still available in size 52?',
          isRead: index % 2 == 0 ? true : false,
        );
      },
    );
    await SimulateMocRepo();
    return ResponseState(data: [...list, ...list], isSuccess: true, statusCode: 200);
  }

  @override
  Future<ResponseState<List<ChatModel>>> fetchChat({
    required int page,
    required String chatId,
  }) async {
    final list = generateMockList(
      builder: (index) {
        // if (index == 0)
        //   return ChatModel(
        //     chatId: 'chatId',
        //     chatType: ChatType.callFailed,
        //     content: '',
        //     userInfo: ChatUserInfo(
        //       userId: index % 2 == 0 ? '' : 'userId',
        //       name: 'Cameron Williamson',
        //       image: Assets.images.sampleItem2.path,
        //     ),
        //     createdAt: DateTime.now(),
        //   );
        // if (index == 1)
        //   return ChatModel(
        //     chatId: 'chatId',
        //     chatType: ChatType.callSuccess,
        //     content: '',

        //     userInfo: ChatUserInfo(
        //       userId: index % 2 == 0 ? '' : 'userId',
        //       name: 'Cameron Williamson',
        //       image: Assets.images.sampleItem2.path,
        //     ),
        //     createdAt: DateTime.now(),
        //   );
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
