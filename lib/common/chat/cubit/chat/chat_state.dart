import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mainland/common/chat/model/chat_model.dart';

class ChatState extends Equatable {
  const ChatState({
    this.chats = const [],
    this.filePath = const [],
    this.pageNo = 0,
    this.isLoading = false,
    this.message = '',
    this.unread = 0,
  });

  final List<ChatModel> chats;
  final int pageNo;
  final bool isLoading;
  final int unread;
  final List<XFile> filePath;
  final String message;

  ChatState copyWith({
    List<ChatModel>? chats,
    List<XFile>? filePath,
    int? pageNo,
    bool? isLoading,
    String? message,
    int? unread,
  }) {
    return ChatState(
      chats: chats ?? this.chats,
      pageNo: pageNo ?? this.pageNo,
      isLoading: isLoading ?? this.isLoading,
      unread: unread ?? this.unread,
      filePath: filePath ?? this.filePath,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [chats, pageNo, isLoading, unread, filePath, message];
}
