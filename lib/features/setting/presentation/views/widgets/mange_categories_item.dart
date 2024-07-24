import 'package:flutter/material.dart';

import '../../../../../core/utility/app_assets.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/widgets/custom_category_widget.dart';

class MangeCategoriesItem extends StatelessWidget {
  const MangeCategoriesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
        leading: CustomCategoryWidget(iconSvgPath: AppAssets.GROCERY_ICON_PATH, iconBackgroundColor: Colors.blueAccent.withOpacity(0.3)),
        title: Text('Groceries',style:AppStyle.body2.copyWith(fontWeight: FontWeight.w600),),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(onPressed: () {}, child: Text('Edit',style: AppStyle.headLine6.copyWith(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold),)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outline,color: Color(0xff9E9E9E),))
          ],
        ),
      ),
    );
  }
}
