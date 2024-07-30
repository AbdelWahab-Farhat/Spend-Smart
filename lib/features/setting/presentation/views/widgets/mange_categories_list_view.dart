import 'package:flutter/material.dart';

import '../../../../../core/models/category/category.dart';
import 'mange_categories_item.dart';

class MangeCategoriesListView extends StatelessWidget {
  final List<Category> categories;
  const MangeCategoriesListView({
    super.key, required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return  MangeCategoriesItem(category: categories[index],);
      },
    );
  }
}
