import 'package:flutter/material.dart';
import 'package:spend_smart/core/widgets/custom_category_widget.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_assets.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/app_style.dart';

class ListViewExpensesItem extends StatelessWidget {
  const ListViewExpensesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCategoryWidget(iconSvgPath: AppAssets.GIFTS_ICON_PATH, iconBackgroundColor: Colors.pink.withOpacity(0.3)),
        const SizedBox(width: 9,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Eggs & veggies',style: AppStyle.body2.copyWith(fontWeight: FontWeight.bold),),
            const Text('Groceries')
          ],
        ),
        const Spacer(),
        Text('- ${AppStrings.currency} 590',style: AppStyle.body2.copyWith(color: kCashRedColor),)
      ],
    );
  }
}
