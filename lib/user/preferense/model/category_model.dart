// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  final String id;
  final String title;
  final String coverImage;
  CategoryModel({required this.id, required this.title, required this.coverImage});

  CategoryModel copyWith({String? id, String? title, String? coverImage}) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      coverImage: coverImage ?? this.coverImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'title': title, 'coverImage': coverImage};
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['_id'] as String,
      title: map['title'] as String,
      coverImage: map['coverImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryModel(id: $id, title: $title, coverImage: $coverImage)';

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.coverImage == coverImage;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ coverImage.hashCode;
}
