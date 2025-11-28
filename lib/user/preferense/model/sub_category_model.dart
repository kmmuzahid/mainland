// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SubCategoryModel {
  final String id;
  final String title;
  SubCategoryModel({required this.id, required this.title});
  

  SubCategoryModel copyWith({String? id, String? title}) {
    return SubCategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'title': title};
  }

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['_id'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategoryModel.fromJson(dynamic source) => SubCategoryModel.fromMap(source);

  @override
  String toString() => 'SubCategoryModel(id: $id, title: $title)';

  @override
  bool operator ==(covariant SubCategoryModel other) {
    if (identical(this, other)) return true;
  
    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
