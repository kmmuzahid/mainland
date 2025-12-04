// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum TicketOwnerType { organizer, attendee }

// enum TicketType { standard, gold, premium, vip, free }

class TicketPickerModel {
  final String id;
  final String? userName;
  final String type;
  final int limit;
  final double price;
  final int count;
  final String sellerId;

  TicketPickerModel({
    required this.id,
    required this.type,
    required this.limit,
    this.userName,
    required this.price,
    required this.count,
    required this.sellerId,
  });

  TicketPickerModel copyWith({
    String? id,
    String? title,
    String? userName,
    int? limit,
    double? price,
    int? count,
    String? sellerId,
  }) {
    return TicketPickerModel(
      id: id ?? this.id,
      type: title ?? this.type,
      limit: limit ?? this.limit,
      price: price ?? this.price,
      userName: userName ?? this.userName,
      count: count ?? this.count,
      sellerId: sellerId ?? this.sellerId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': type,
      'limit': limit,
      'price': price,
      'count': count,
      'userName': userName,
      'sellerId': sellerId,
    };
  }

  factory TicketPickerModel.fromMap(Map<String, dynamic> map) {
    return TicketPickerModel(
      type: map['title'] ?? '',
      id: map['id'] ?? '',
      userName: map['userName'] ?? '',
      limit: map['limit']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0,
      count: map['count']?.toInt() ?? 0,
      sellerId: map['sellerId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketPickerModel.fromJson(String source) =>
      TicketPickerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TicketPickerModel(title: $type, limit: $limit, price: $price, count: $count, userName: $userName)';
  }

  @override
  bool operator ==(covariant TicketPickerModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.limit == limit &&
        other.price == price &&
        other.userName == userName &&
        other.count == count &&
        other.id == id &&
        other.sellerId == sellerId;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        limit.hashCode ^
        price.hashCode ^
        count.hashCode ^
        userName.hashCode ^
        id.hashCode ^
        sellerId.hashCode;
  }
}
