import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_smart/core/models/category/category.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/transaction_cubits/transaction_cubit/transaction_cubit.dart';
import '../../../../../core/models/category/category_utils.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/widgets/custom_category_widget.dart';

class GirdViewItem extends StatelessWidget {
  final Category  category;
  const GirdViewItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    var RGBOcolors = CategoryUtils.getRGBO(RGBO_STR: category.categoryRGBOColor);
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    return  GestureDetector(
      onTap: () {
        transactionCubit.initCategory(category);
        GoRouter.of(context).pop();
      },
      child: Column(
        children: [
          CustomCategoryWidget(
              iconSvgPath: category.svgIconImg,
              iconBackgroundColor: Color.fromRGBO(RGBOcolors[0].toInt(), RGBOcolors[1].toInt() ,RGBOcolors[2].toInt(), RGBOcolors[3].toDouble() )),
          const SizedBox(height: 5,),
          Text(category.categoryName,style: AppStyle.body2.copyWith(fontSize: 12),)
        ],
      ),
    );
  }
}
