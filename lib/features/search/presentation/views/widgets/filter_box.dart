import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spend_smart/constants.dart';
import 'package:spend_smart/core/utility/app_assets.dart';
import 'package:spend_smart/core/utility/app_style.dart';


class FilterBox extends StatelessWidget {
  const FilterBox({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.all(8),
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: kBorderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
       children: [
         SvgPicture.asset(AppAssets.GROCERY_ICON_PATH),
         const SizedBox(width: 8,),
          Text('Groceries',style: AppStyle.body2.copyWith(overflow: TextOverflow.ellipsis),maxLines: 1,)
       ],
      ),
    );
  }
}
