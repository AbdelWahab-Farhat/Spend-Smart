import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/widgets/custom_app_bar.dart';
import 'package:spend_smart/core/widgets/custom_error_widget.dart';
import 'package:spend_smart/core/widgets/custom_loading_widget.dart';
import 'package:spend_smart/features/setting/presentation/viewModel/manage_categories_cubit/manage_categories_cubit.dart';
import 'mange_categories_list_view.dart';

class MangeCategoriesViewBody extends StatefulWidget {
  const MangeCategoriesViewBody({super.key});

  @override
  State<MangeCategoriesViewBody> createState() => _MangeCategoriesViewBodyState();
}

class _MangeCategoriesViewBodyState extends State<MangeCategoriesViewBody> {
  @override
  void initState() {
    context.read<ManageCategoriesCubit>().fetchUserCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Manage Categories'),
      body: BlocListener<ManageCategoriesCubit, ManageCategoriesState>(
        listener: (context, state) {
          if (state is ManageCategoriesSuccess) {
          }
        },
        child: BlocBuilder<ManageCategoriesCubit, ManageCategoriesState>(
          builder: (context, state) {
            if (state is ManageCategoriesFailure) {
              return CustomErrorWidget(errMessage: state.errMessage);
            } else if (state is ManageCategoriesSuccess) {
              if (state.categories.isEmpty) {
                return const Center(child: Text('No Custom User Categories'));
              }
              return MangeCategoriesListView(categories: state.categories);
            }
            return const CustomLoadingWidget();
          },
        ),
      ),
    );
  }
}
