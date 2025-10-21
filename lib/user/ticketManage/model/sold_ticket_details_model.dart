// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SoldTicketDetailsModel {
  final String type;
  final int unit;
  final double soldPrice;
  final double mainlandCommission;
  final double yourPayout;
  SoldTicketDetailsModel({
    required this.type,
    required this.unit,
    required this.soldPrice,
    required this.mainlandCommission,
    required this.yourPayout,
  });

  SoldTicketDetailsModel copyWith({
    String? type,
    int? unit,
    double? soldPrice,
    double? mainlandCommission,
    double? yourPayout,
  }) {
    return SoldTicketDetailsModel(
      type: type ?? this.type,
      unit: unit ?? this.unit,
      soldPrice: soldPrice ?? this.soldPrice,
      mainlandCommission: mainlandCommission ?? this.mainlandCommission,
      yourPayout: yourPayout ?? this.yourPayout,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'unit': unit,
      'soldPrice': soldPrice,
      'mainlandCommission': mainlandCommission,
      'yourPayout': yourPayout,
    };
  }

  factory SoldTicketDetailsModel.fromMap(Map<String, dynamic> map) {
    return SoldTicketDetailsModel(
      type: map['type'] as String,
      unit: map['unit'] as int,
      soldPrice: map['soldPrice'] as double,
      mainlandCommission: map['mainlandCommission'] as double,
      yourPayout: map['yourPayout'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory SoldTicketDetailsModel.fromJson(String source) =>
      SoldTicketDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SoldTicketDetailsModel(type: $type, unit: $unit, soldPrice: $soldPrice, mainlandCommission: $mainlandCommission, yourPayout: $yourPayout)';
  }

  @override
  bool operator ==(covariant SoldTicketDetailsModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.unit == unit &&
        other.soldPrice == soldPrice &&
        other.mainlandCommission == mainlandCommission &&
        other.yourPayout == yourPayout;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        unit.hashCode ^
        soldPrice.hashCode ^
        mainlandCommission.hashCode ^
        yourPayout.hashCode;
  }
}
