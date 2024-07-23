import 'package:flutter/material.dart';
import 'package:spend_smart/core/utility/app_strings.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/utility/size_config.dart';
import 'bottom_sheet_grid_view.dart';

class NewCategoryBottomSheet extends StatelessWidget {
  const NewCategoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: SizeConfig.viewWidth,
      height: SizeConfig.viewHeight! * 0.45,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30))),
      child: Column(
        children: [
          Text(
            AppStrings.TRANSACTION_CHOOSE_CATEGORY_TEXT,
            style: AppStyle.body2
                .copyWith(letterSpacing: 1.5, fontSize: 13),
          ),
          const Expanded(
            child: BottomSheetGridView(crossAxisNumber: 4,isNewCategorySheet: true,),
          ),
        ],
      ),
    );
  }
}


