import 'package:mainland/common/chat/repository/chat_repository.dart';

import 'package:mainland/core/config/bloc/safe_cubit.dart';
import 'package:mainland/core/config/dependency/dependency_injection.dart';

import 'chat_list_state.dart';

class ChatListCubit extends SafeCubit<ChatListState> {
  ChatListCubit() : super(const ChatListState());

  final ChatRepository _repository = getIt();

  int? _getPageNo(List responce) => responce.isNotEmpty ? state.pageNo + 1 : null;

  Future<void> fetch() async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true, chatListItems: [], pageNo: 0));
    final responce = await _repository.fetchChatList(page: 0);
    emit(
      state.copyWith(
        chatListItems: responce.data,
        isLoading: false,
        pageNo: _getPageNo(responce.data),
      ),
    );
  }

  Future<void> loadMore() async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final responce = await _repository.fetchChatList(page: state.pageNo);
    emit(
      state.copyWith(
        isLoading: false,
        chatListItems: [...state.chatListItems ?? [], ...responce.data],
        pageNo: _getPageNo(responce.data),
      ),
    );
  }
}
