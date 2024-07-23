import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/app_style.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: TextField(
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