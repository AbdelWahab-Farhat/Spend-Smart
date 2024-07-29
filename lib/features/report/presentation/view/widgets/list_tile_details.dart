import 'package:flutter/material.dart';
import 'package:spend_smart/core/models/category/category_utils.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/transaction/transaction.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/widgets/custom_category_widget.dart';

class ListTileDetails extends StatelessWidget {
  final List<Transaction> transactionByCategory;
  final double percent;
  const ListTileDetails({
    super.key,
    required this.transactionByCategory,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    double transactionsPrice = transactionByCategory.fold(
      0.0,
      (sum, element) {
        return sum += element.amount;
      },
    );
    List<num> rgbo = CategoryUtils.getRGBO(
        RGBO_STR: transactionByCategory.first.category.categoryRGBOColor);
    return ListTile(
      leading: CustomCategoryWidget(
          iconSvgPath: transactionByCategory.first.category.svgIconImg,
          iconBackgroundColor: Color.fromRGBO(rgbo[0].toInt(), rgbo[1].toInt(),
              rgbo[2].toInt(), rgbo[3].toDouble())),
      
      title: Text(
        transactionByCategory.first.category.categoryName,
        style: AppStyle.headLine6.copyWith(fontSize: 17),
      ),

      subtitle: Text(
        '${transactionByCategory.length} ${AppStrings.REPORT_TRANSACTIONS_TEXT}',
        style: AppStyle.body2.copyWith(color: kAccentColor),
      ),

      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '- ${AppStrings.currency} $transactionsPrice',
            style: AppStyle.body2.copyWith(color: kCashRedColor, fontSize: 15),
          ),
          Text(
            '${percent.toStringAsFixed(1)}%',
            style: AppStyle.body2.copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
