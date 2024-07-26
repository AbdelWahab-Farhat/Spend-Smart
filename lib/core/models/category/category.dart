import 'package:hive/hive.dart';
part 'category.g.dart';

@HiveType(typeId: 69, adapterName: 'CategoryAdapter')
class Category {
  @HiveField(0)
  final String categoryID;
  @HiveField(1)
  final String categoryName;
  @HiveField(2)
  final String svgIconImg;
  @HiveField(3)
  final String categoryRGBOColor;

  Category({
    required this.categoryID,
    required this.categoryName,
    required this.svgIconImg,
    required this.categoryRGBOColor,
  });

  // fromJson method
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryID: json['categoryID'],
      categoryName: json['categoryName'],
      svgIconImg: json['svgIconImg'],
      categoryRGBOColor: json['categoryRGBOColor'],
    );
  }
  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'categoryID': categoryID,
      'categoryName': categoryName,
      'svgIconImg': svgIconImg,
      'categoryRGBOColor': categoryRGBOColor,
    };
  }
}
