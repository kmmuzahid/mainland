// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TicketPickerModel {
  final String title;
  final int limit;
  final double price;
  final int count;

  TicketPickerModel({
    required this.title,
    required this.limit,
    required this.price,
    required this.count,
  });

  TicketPickerModel copyWith({String? title, int? limit, double? price, int? count}) {
    return TicketPickerModel(
      title: title ?? this.title,
      limit: limit ?? this.limit,
      price: price ?? this.price,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'title': title, 'limit': limit, 'price': price, 'count': count};
  }

  factory TicketPickerModel.fromMap(Map<String, dynamic> map) {
    return TicketPickerModel(
      title: map['title'] as String,
      limit: map['limit'] as int,
      price: map['price'] as double,
      count: map['count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketPickerModel.fromJson(String source) =>
      TicketPickerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TicketPickerModel(title: $title, limit: $limit, price: $price, count: $count)';
  }

  @override
  bool operator ==(covariant TicketPickerModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.limit == limit &&
        other.price == price &&
        other.count == count;
  }

  @override
  int get hashCode {
    return title.hashCode ^ limit.hashCode ^ price.hashCode ^ count.hashCode;
  }
}
