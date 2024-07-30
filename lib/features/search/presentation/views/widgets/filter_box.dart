import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spend_smart/constants.dart';
import 'package:spend_smart/core/utility/app_assets.dart';
import 'package:spend_smart/core/utility/app_style.dart';
import 'package:spend_smart/features/search/presentation/viewModel/category_filter_cubit/category_filter_cubit.dart';
import '../../../../../core/models/category/category.dart';
import '../../viewModel/search_cubit/search_cubit.dart';

class FilterBox extends StatelessWidget {
  final Category category;
  const FilterBox({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    var getCategoryFilterCubit = context.read<CategoryFilterCubit>();
    var getSearchCubit = context.read<SearchCubit>();
    bool isFiltered = getCategoryFilterCubit.isFiltered(category);
    return GestureDetector(
      onTap: () {
        getCategoryFilterCubit.filtering(category);
        getSearchCubit.updateState();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.all(8),
        height: 40,
        decoration: BoxDecoration(
          color:  isFiltered ? const Color(0xff006ADD).withOpacity(0.3) : Colors.white,
          border: Border.all(color: isFiltered ? const Color(0xff006ADD) :kBorderColor,width: isFiltered ? 1.3 : 1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(isFiltered ? AppAssets.MARKED_ICON_PATH :category.svgIconImg),
            const SizedBox(
              width: 8,
            ),
            Text(
              category.categoryName,
              style: AppStyle.body2.copyWith(overflow: TextOverflow.ellipsis),
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
