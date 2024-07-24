import 'package:flutter/material.dart';

import 'mange_categories_item.dart';

class MangeCategoriesListView extends StatelessWidget {
  const MangeCategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const MangeCategoriesItem();
      },
    );
  }
}
