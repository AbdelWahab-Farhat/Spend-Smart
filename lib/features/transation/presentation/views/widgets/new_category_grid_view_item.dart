import 'package:flutter/material.dart';

import '../../../../../core/utility/app_assets.dart';
import '../../../../../core/widgets/custom_category_widget.dart';


class NewCategoryGridViewItem extends StatelessWidget {
  const NewCategoryGridViewItem({super.key});
  // I WILL MAKE IT DISPERSE AFTER CLICK
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: CustomCategoryWidget(
          iconSvgPath: AppAssets.GIFTS_ICON_PATH,
          iconBackgroundColor: Colors.red.withOpacity(0.3)),
    );
  }
}
