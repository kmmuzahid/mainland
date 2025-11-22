// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SubCategoryModel {
  final String id;
  final String subcategoryTitle;
  SubCategoryModel({required this.id, required this.subcategoryTitle});

  SubCategoryModel copyWith({String? id, String? subcategoryTitle}) {
    return SubCategoryModel(
      id: id ?? this.id,
      subcategoryTitle: subcategoryTitle ?? this.subcategoryTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'subcategoryTitle': subcategoryTitle};
  }

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['_id'] as String,
      subcategoryTitle: map['subcategoryTitle'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategoryModel.fromJson(String source) =>
      SubCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SubCategoryModel(id: $id, subcategoryTitle: $subcategoryTitle)';

  @override
  bool operator ==(covariant SubCategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.subcategoryTitle == subcategoryTitle;
  }

  @override
  int get hashCode => id.hashCode ^ subcategoryTitle.hashCode;
}
