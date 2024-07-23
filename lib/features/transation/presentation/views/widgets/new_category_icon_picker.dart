import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'new_category_bottom_sheet.dart';

class NewCategoryIconPicker extends StatelessWidget {
  const NewCategoryIconPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(context: context,
          showDragHandle: true,
          builder: (context) {
            return const NewCategoryBottomSheet();
          },
        );
      },
      child: DottedBorder(
        padding: const EdgeInsets.all(15),
        color: Colors.grey, // Border color
        strokeWidth: 1.2, // Border width
        dashPattern: const [5, 3],
        borderType: BorderType.Circle,
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}
