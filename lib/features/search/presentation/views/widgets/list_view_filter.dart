import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/models/category/category.dart';
import 'package:spend_smart/features/search/presentation/viewModel/category_filter_cubit/category_filter_cubit.dart';

import 'filter_box.dart';


class ListViewFilters extends StatelessWidget {
  const ListViewFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: BlocBuilder<CategoryFilterCubit, CategoryFilterState>(
        builder: (context, state) {
          var getCategoryFilterCubit  = context.read<CategoryFilterCubit>();
          List<Category>? categories = getCategoryFilterCubit.categories;
          if (categories == null  || categories.isEmpty) {
            return const SizedBox();
          }
          return ListView.builder(
            padding: const EdgeInsets.only(right: 10),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return  FilterBox(category: categories[index],);
            },);
        },
      ),
    );
  }
}