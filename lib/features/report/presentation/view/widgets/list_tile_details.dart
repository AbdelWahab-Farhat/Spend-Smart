import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_assets.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/widgets/custom_category_widget.dart';

class ListTileDetails extends StatelessWidget {
  const ListTileDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomCategoryWidget(iconSvgPath: AppAssets.COMMUTE_ICON_PATH, iconBackgroundColor: Colors.blueAccent.withOpacity(0.3)),
      title:  Text('Transportation',style: AppStyle.headLine6.copyWith(fontSize: 17),),
      subtitle:  Text('16 ${AppStrings.REPORT_TRANSACTIONS_TEXT}',style:AppStyle.body2.copyWith(color: kAccentColor),),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('- ${AppStrings.currency} 5300',style: AppStyle.body2.copyWith(color: kCashRedColor,fontSize: 15),),
          Text('12%',style: AppStyle.body2.copyWith(fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}
