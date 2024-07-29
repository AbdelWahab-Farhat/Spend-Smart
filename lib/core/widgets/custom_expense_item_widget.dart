import 'package:flutter/material.dart';
import 'package:spend_smart/core/models/category/category_utils.dart';
import 'package:spend_smart/core/utility/size_config.dart';

import '../../constants.dart';
import '../models/transaction/transaction.dart';
import '../utility/app_strings.dart';
import '../utility/app_style.dart';
import 'custom_category_widget.dart';

class CustomExpenseItemWidget extends StatelessWidget {
  final Transaction transaction;
  const CustomExpenseItemWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    List<num> rgbo =
        CategoryUtils.getRGBO(RGBO_STR: transaction.category.categoryRGBOColor);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCategoryWidget(
            iconSvgPath: transaction.category.svgIconImg,
            iconBackgroundColor: Color.fromRGBO(rgbo[0].toInt(),
                rgbo[1].toInt(), rgbo[2].toInt(), rgbo[3].toDouble())),
        const SizedBox(
          width: 9,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: SizeConfig.viewWidth! * 0.48,
              child: Text(
                transaction.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.body2.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
             Text(transaction.category.categoryName)
          ],
        ),
        const Spacer(),
            Text(
            '- ${AppStrings.currency} ${transaction.amount.toStringAsFixed(0)}',
            style: AppStyle.body2.copyWith(color: kCashRedColor),
          ),
      ],
    );
  }
}
