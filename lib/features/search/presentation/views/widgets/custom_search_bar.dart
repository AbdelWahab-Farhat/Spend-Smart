import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_smart/features/search/presentation/viewModel/search_cubit/search_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/app_style.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    var getSearchCubit = context.read<SearchCubit>();
    return  SafeArea(
      child: TextField(
        onChanged: (value) {
          getSearchCubit.updateState();
        },
        controller: getSearchCubit.controllerSearch,
        decoration: InputDecoration(
          prefixIcon: GestureDetector(
              onTap: () => GoRouter.of(context).pop(),
              child: const Icon(Icons.arrow_back)),
          hintText: AppStrings.SEARCH_HINT_TEXT,
          hintMaxLines: 1,
          hintStyle: AppStyle.body2.copyWith(fontSize: 15,color: kAccentColor),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 11),
        ),
      ),
    );
  }
}