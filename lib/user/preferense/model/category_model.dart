// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryModel {
  final String id;
  final String title;
  final String coverImage;

  CategoryModel({required this.id, required this.title, required this.coverImage});
  

 

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['_id'] as String? ?? '',
      title: map['title'] as String? ?? '',
      coverImage: map['coverImage'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'coverImage': coverImage};
  }

  @override
  String toString() => 'CategoryModel(id: $id, title: $title, coverImage: $coverImage)';
 
  
}
