import 'package:flutter/material.dart';
import 'package:spend_smart/features/setting/presentation/views/widgets/edit_category_view_body.dart';

import '../../../../core/models/category/category.dart';


class EditCategoryView extends StatelessWidget {
  final Category category;

  const EditCategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return EditCategoryViewBody(category: category,);
  }
}
