import 'package:flutter/material.dart';

import '../../../../../core/utility/app_assets.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/widgets/custom_category_widget.dart';

class GirdViewItem extends StatelessWidget {

  const GirdViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomCategoryWidget(
            iconSvgPath: AppAssets.GIFTS_ICON_PATH,
            iconBackgroundColor: Colors.red.withOpacity(0.3)),
        const SizedBox(height: 5,),
        Text('Gifts',style: AppStyle.body2.copyWith(fontSize: 12),)
      ],
    );
  }
}
