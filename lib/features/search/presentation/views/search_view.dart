import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/repo/core_repo_impl.dart';
import 'package:spend_smart/features/search/presentation/viewModel/category_filter_cubit/category_filter_cubit.dart';
import 'package:spend_smart/features/search/presentation/viewModel/search_cubit/search_cubit.dart';

import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryFilterCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(CoreRepoImpl()),
        ),
      ],
      child: const SearchViewBody(),
    );
  }
}
