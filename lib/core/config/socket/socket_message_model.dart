// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SocketMessageModel {
  final String? message;
  final String? messageType;
  final String? chatId;
  final Sender sender;
  final String? image;
  SocketMessageModel({
    this.message,
    this.messageType,
    this.chatId,
    required this.sender,
    this.image,
  });


  SocketMessageModel copyWith({
    String? message,
    String? messageType,
    String? chatId,
    Sender? sender,
    String? image,
  }) {
    return SocketMessageModel(
      message: message ?? this.message,
      messageType: messageType ?? this.messageType,
      chatId: chatId ?? this.chatId,
      sender: sender ?? this.sender,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'messageType': messageType,
      'chatId': chatId,
      'sender': sender.toMap(),
      'image': image,
    };
  }

  factory SocketMessageModel.fromMap(Map<String, dynamic> map) {
    return SocketMessageModel(
      message: map['message'] != null ? map['message'] as String : null,
      messageType: map['messageType'] != null ? map['messageType'] as String : null,
      chatId: map['chatId'] != null ? map['chatId'] as String : null,
      sender: Sender.fromMap(map['sender'] as Map<String, dynamic>),
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocketMessageModel.fromJson(dynamic source) => SocketMessageModel.fromMap(
      source is String ? json.decode(source) as Map<String, dynamic> : source);

  @override
  String toString() {
    return 'SocketMessageModel(message: $message, messageType: $messageType, chatId: $chatId, sender: $sender, image: $image)';
  }

  @override
  bool operator ==(covariant SocketMessageModel other) {
    if (identical(this, other)) return true;
  
    return other.message == message &&
        other.messageType == messageType &&
        other.chatId == chatId &&
        other.sender == sender &&
        other.image == image;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        messageType.hashCode ^
        chatId.hashCode ^
        sender.hashCode ^
        image.hashCode;
  }
}

class Sender {
  final String? id;
  final String? fullName;
  final String? email;
  Sender({
    required this.id,
    required this.fullName,
    required this.email,
  });

  Sender copyWith({
    String? id,
    String? fullName,
    String? email,
  }) {
    return Sender(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'fullName': fullName,
      'email': email,
    };
  }

  factory Sender.fromMap(Map<String, dynamic> map) {
    return Sender(
      id: map['_id'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sender.fromJson(String source) =>
      Sender.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Sender(_id: $id, fullName: $fullName, email: $email)';

  @override
  bool operator ==(covariant Sender other) {
    if (identical(this, other)) return true;

    return other.id == id && other.fullName == fullName && other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ fullName.hashCode ^ email.hashCode;
}
