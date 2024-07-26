import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/models/category/category.dart';
import 'package:spend_smart/core/models/category/category_utils.dart';
import 'package:spend_smart/core/widgets/custom_category_widget.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/icon_picker_cubit/icon_picker_cubit.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/transaction_cubits/category_cubit/category_cubit.dart';

import 'new_category_bottom_sheet.dart';

class NewCategoryIconPicker extends StatelessWidget {
  final BuildContext ctx;

  const NewCategoryIconPicker({
    super.key, required this.ctx,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(context: context,
          showDragHandle: true,
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: BlocProvider.of<CategoryCubit>(ctx),
                ),
                BlocProvider.value(
                  value: BlocProvider.of<IconPickerCubit>(ctx),
                )
              ],
              child: const NewCategoryBottomSheet(),
            );
          },
        );
      },
      child:

      BlocBuilder<IconPickerCubit, IconPickerState>(
        builder: (context, state) {
          if (state is IconPickerChanged) {
            Category category = context.read<IconPickerCubit>().newCategoryValue!;
            List<num> rgbo = CategoryUtils.getRGBO(RGBO_STR: category.categoryRGBOColor);
            return CustomCategoryWidget(iconSvgPath: category.svgIconImg,
                iconBackgroundColor: Color.fromRGBO(rgbo[0].toInt(), rgbo[1].toInt(), rgbo[2].toInt(), rgbo[3].toDouble()));
          }
          return DottedBorder(
            padding: const EdgeInsets.all(15),
            color: Colors.grey,
            // Border color
            strokeWidth: 1.2,
            // Border width
            dashPattern: const [5, 3],
            borderType: BorderType.Circle,
            child: const Icon(Icons.add_circle),
          );
        },
      ),
    );
  }
}
