import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utility/app_assets.dart';
import '../utility/app_strings.dart';
import '../utility/app_style.dart';
import 'custom_category_widget.dart';

class CustomExpenseItemWidget extends StatelessWidget {
  const CustomExpenseItemWidget({super.key});

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