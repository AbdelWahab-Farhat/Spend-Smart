import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/features/setting/data/repo/manage_cateogries_repo/manage_categories_repo_impl.dart';
import 'package:spend_smart/features/setting/presentation/viewModel/manage_categories_cubit/manage_categories_cubit.dart';
import 'package:spend_smart/features/setting/presentation/views/widgets/mange_categories_view_body.dart';

class MangeCategoriesView extends StatelessWidget {
  const MangeCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageCategoriesCubit(ManageCategoriesRepoImpl()),
      child: const MangeCategoriesViewBody(),
    );
  }
}
