import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/constants.dart';
import 'package:spend_smart/features/search/presentation/viewModel/category_filter_cubit/category_filter_cubit.dart';
import 'package:spend_smart/features/search/presentation/viewModel/search_cubit/search_cubit.dart';
import 'package:spend_smart/features/search/presentation/views/widgets/result_section.dart';

import 'custom_search_bar.dart';
import 'list_view_filter.dart';

class SearchViewBody extends StatefulWidget {

  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    context.read<CategoryFilterCubit>().initCategories();
    context.read<SearchCubit>().initUserTransactions();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
      statusBarColor: const Color(0xff212121).withOpacity(0.3),
    ));
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CustomSearchBar(),
            SizedBox(height: 20,),
              ListViewFilters(),
              Divider(color: kBorderColor,),
              ResultSection(),
          ],),
        ),
      ),
    );
  }
}




