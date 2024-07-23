import 'package:flutter/material.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/gird_view_item.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/new_category_grid_view_item.dart';


class BottomSheetGridView extends StatelessWidget {
  final bool? isNewCategorySheet;
  final int crossAxisNumber;
  const BottomSheetGridView({
    super.key, required this.crossAxisNumber, this.isNewCategorySheet,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 20),
      physics: const ClampingScrollPhysics(),
      gridDelegate:
       SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent:isNewCategorySheet == null ? 70 : 30,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          crossAxisCount: crossAxisNumber
      ),
      itemCount: 9,
      itemBuilder: (context, index) =>isNewCategorySheet == null  ? const GirdViewItem() : const NewCategoryGridViewItem(),
    );
  }
}
