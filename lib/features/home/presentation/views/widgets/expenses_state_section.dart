import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_assets.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/size_config.dart';
import 'expenses_state_item.dart';
class ExpensesStateSection extends StatelessWidget {
  const ExpensesStateSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      width: SizeConfig.viewWidth,
      height: SizeConfig.viewHeight! * 0.14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kBorderColor),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ExpensesStateItem(
            color: kCashRedColor,
            title: AppStrings.HOME_EXPENSES_TEXT,
            iconSvgImage: AppAssets.CASH_ICON_PATH,
            amount: 12000,
          ),
          ExpensesStateItem(
            color: kCashGreenColor,
            title: AppStrings.HOME_BALANCE_TEXT,
            iconSvgImage: AppAssets.CASH_ICON_PATH,
            amount: 30000,
          ),
          ExpensesStateItem(
            color: kSecondaryColor,
            title: AppStrings.HOME_INCOME_TEXT,
            iconSvgImage: AppAssets.CASH_ICON_PATH,
            amount: 48000,
          ),
        ],
      ) ,
    );
  }
}
