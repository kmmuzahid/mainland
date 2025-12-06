// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QrCodeModel {
  final String userId;
  final String eventId;
  final String eventCode;
  QrCodeModel({required this.userId, required this.eventId, required this.eventCode});

  QrCodeModel copyWith({String? userId, String? eventId, String? eventCode}) {
    return QrCodeModel(
      userId: userId ?? this.userId,
      eventId: eventId ?? this.eventId,
      eventCode: eventCode ?? this.eventCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'userId': userId, 'eventId': eventId, 'eventCode': eventCode};
  }

  factory QrCodeModel.fromMap(Map<String, dynamic> map) {
    return QrCodeModel(
      userId: map['userId'] as String,
      eventId: map['eventId'] as String,
      eventCode: map['eventCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QrCodeModel.fromJson(String source) =>
      QrCodeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QrCodeModel(userId: $userId, eventId: $eventId, eventCode: $eventCode)';

  @override
  bool operator ==(covariant QrCodeModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId && other.eventId == eventId && other.eventCode == eventCode;
  }

  @override
  int get hashCode => userId.hashCode ^ eventId.hashCode ^ eventCode.hashCode;
}
