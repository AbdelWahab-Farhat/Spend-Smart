import 'package:flutter/material.dart';
import 'package:spend_smart/core/widgets/custom_app_bar.dart';

import 'mange_categories_list_view.dart';

class MangeCategoriesViewBody extends StatelessWidget {
  const MangeCategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: CustomAppBar(title: 'Mange Categories'),
      body: MangeCategoriesListView(),
    );
  }
}


