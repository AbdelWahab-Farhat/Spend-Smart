import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/features/transation/data/repo/category_repo/category_repo_impl.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/icon_picker_cubit/icon_picker_cubit.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/new_category_cubit/new_category_cubit.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/transaction_cubits/category_cubit/category_cubit.dart';
import 'widgets/new_category_body.dart';

class NewCategoryView extends StatelessWidget {
  const NewCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit(CategoryRepoImpl()),
        ),
        BlocProvider(
          create: (context) => IconPickerCubit(),
        ),
        BlocProvider(
          create: (context) => NewCategoryCubit(CategoryRepoImpl()),
        ),
      ],
      child: const NewCategoryBody(),
    );
  }
}
