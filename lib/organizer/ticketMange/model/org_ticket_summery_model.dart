class OrgTicketSummeryModel {
  OrgTicketSummeryModel({this.type, this.price, this.availableUnits, this.outstandingUnits});

  /// Factory constructor for creating a new instance from a map.
  factory OrgTicketSummeryModel.fromJson(Map<String, dynamic> json) {
    return OrgTicketSummeryModel(
      type: json['type'],
      price: json['price'],
      availableUnits: json['availableUnits'],
      outstandingUnits: json['outstandingUnits'],
    );
  }
  final String? type;
  final int? price;
  final int? availableUnits;
  final int? outstandingUnits;

  /// Converts this instance to a map.
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'price': price,
      'availableUnits': availableUnits,
      'outstandingUnits': outstandingUnits,
    };
  }

  /// Copy method to create a new instance with updated values.
  OrgTicketSummeryModel copyWith({
    String? type,
    int? price,
    int? availableUnits,
    int? outstandingUnits,
  }) {
    return OrgTicketSummeryModel(
      type: type ?? this.type,
      price: price ?? this.price,
      availableUnits: availableUnits ?? this.availableUnits,
      outstandingUnits: outstandingUnits ?? this.outstandingUnits,
    );
  }
}
