import 'package:flutter/material.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/gird_view_item.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/new_category_grid_view_item.dart';

import '../../../../../core/models/category/category.dart';


class BottomSheetGridView extends StatelessWidget {
  final bool? isNewCategorySheet;
  final int crossAxisNumber;
  final List<Category> categories;
  const BottomSheetGridView({
    super.key, required this.crossAxisNumber, this.isNewCategorySheet, required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding:  EdgeInsets.only(top: 20 ,bottom: isNewCategorySheet == null ? 0 : 10),
      physics: const ClampingScrollPhysics(),
      gridDelegate:
       SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent:isNewCategorySheet == null ? 70 : 40,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          crossAxisCount: crossAxisNumber
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        if (isNewCategorySheet == null) {
          return  GirdViewItem(category: categories[index],);
        }
        else {
          return  NewCategoryGridViewItem(category: categories[index],);
        }
      },
    );
  }
}
