import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        CircleAvatar(
          backgroundColor: Colors.green.withOpacity(0.3),
          child: SvgPicture.asset(AppAssets.GROCERY_ICON_PATH),
        ),
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
