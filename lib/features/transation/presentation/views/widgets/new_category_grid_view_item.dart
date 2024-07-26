import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_smart/core/models/category/category.dart';
import 'package:spend_smart/core/models/category/category_utils.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/icon_picker_cubit/icon_picker_cubit.dart';

import '../../../../../core/widgets/custom_category_widget.dart';

class NewCategoryGridViewItem extends StatelessWidget {
  final Category category;
  const NewCategoryGridViewItem({super.key, required this.category});
  // I WILL MAKE IT DISPERSE AFTER CLICK
  @override
  Widget build(BuildContext context) {
    var RGBOcolors = CategoryUtils.getRGBO(RGBO_STR: category.categoryRGBOColor);
    return GestureDetector(
      onTap: () {
        context.read<IconPickerCubit>().initNewCategoryValue(category);
        GoRouter.of(context).pop();
      },
        child: CustomCategoryWidget(
            iconSvgPath: category.svgIconImg,
            iconBackgroundColor: Color.fromRGBO(
                RGBOcolors[0].toInt(),
                RGBOcolors[1].toInt(),
                RGBOcolors[2].toInt(),
                RGBOcolors[3].toDouble())));
  }
}
