import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';

class ExpensesStateItem extends StatelessWidget {
  final String title;
  final String iconSvgImage;
  final double amount;
  final Color color;
  const ExpensesStateItem({
    super.key,
    required this.title,
    required this.iconSvgImage,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(iconSvgImage),
        const SizedBox(
          height: 8,
        ),
        Text(
          'LY ${amount.toStringAsFixed(0)}',
          style: AppStyle.body2
              .copyWith(fontWeight: FontWeight.bold, color: color),
        ),
        const SizedBox(
          height: 1.5,
        ),
        Text(
          title,
          style: AppStyle.body2
              .copyWith(fontWeight: FontWeight.w400, color: kAccentColor),
        ),
      ],
    );
  }
}
