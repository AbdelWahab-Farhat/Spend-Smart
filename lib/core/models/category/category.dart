
import 'package:hive/hive.dart';
part 'category.g.dart';

@HiveType(typeId: 69,adapterName: 'CategoryAdapter')
class Category {
  @HiveField(0)
  final String categoryID;
  @HiveField(1)
  final String categoryName;
  @HiveField(2)
  final String svgIconImg;
  @HiveField(3)
  final String categoryRGBOColor;

  Category({required this.categoryID,
    required this.categoryName,
    required this.svgIconImg,
    required this.categoryRGBOColor
  });
}
