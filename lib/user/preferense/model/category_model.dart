// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mainland/user/preferense/model/sub_category_model.dart';

class CategoryModel {
  final String id;
  final String title;
  final String coverImage;
  final List<SubCategoryModel> subCategories;
  CategoryModel({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.subCategories,
  });

  

  CategoryModel copyWith({
    String? id,
    String? title,
    String? coverImage,
    List<SubCategoryModel>? selectedCategories,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      coverImage: coverImage ?? this.coverImage,
      subCategories: selectedCategories ?? this.subCategories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'coverImage': coverImage,
      'subCategories': subCategories.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['_id']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
      coverImage: map['coverImage']?.toString() ?? '',
      subCategories: List<SubCategoryModel>.from(
        ((map['subCategories'] ?? []) as List<dynamic>).map<SubCategoryModel>(
          (x) => SubCategoryModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoryModel(id: $id, title: $title, coverImage: $coverImage, selectedCategories: $subCategories)';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;
  
    return other.id == id &&
        other.title == title &&
        other.coverImage == coverImage &&
        listEquals(other.subCategories, subCategories);
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ coverImage.hashCode ^ subCategories.hashCode;
  }
}
