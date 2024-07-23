import 'package:flutter/material.dart';
import 'package:spend_smart/core/utility/app_strings.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      width: 180,
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(color: kBorderColor, strokeAlign: 2, width: 2),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        AppStrings.TRANSACTION_NEW_CATEGORY_TEXT,
        textAlign: TextAlign.center,
        style:
            AppStyle.headLine6.copyWith(fontSize: 17, color: kOnPrimaryColor),
      ),
    );
  }
}
