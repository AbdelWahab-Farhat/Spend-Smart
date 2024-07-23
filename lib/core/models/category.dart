class Category {
  final String categoryID;
  final String categoryName;
  final String svgIconImg;
  late final String categoryColor;

  Category(
      {required this.categoryID,
      required this.categoryName,
      required this.svgIconImg,
      });


  void createColor() {
    colors.shuffle();
  categoryColor = colors[4];
  }
}



List<String> colors = [
  "FF0000", // Red
  "FFC0CB", // Pink
  "800080", // Purple
  "673AB7", // Deep Purple
  "4B0082", // Indigo
  "0000FF", // Blue
  "ADD8E6", // Light Blue
  "00FFFF", // Cyan
  "008080", // Teal
  "008000", // Green
  "90EE90", // Light Green
  "00FF00", // Lime
  "FFFF00", // Yellow
  "FFBF00", // Amber
  "FFA500", // Orange
  "FF4500", // Deep Orange
  "A52A2A", // Brown
  "808080", // Grey
  "607D8B", // Blue Grey
];
