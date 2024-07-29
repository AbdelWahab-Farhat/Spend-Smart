import 'package:flutter/material.dart';
import 'package:spend_smart/constants.dart';
import 'package:spend_smart/core/utility/app_style.dart';

class CustomWarningWidget extends StatelessWidget {
  final String text;
  const CustomWarningWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      text,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: AppStyle.headLine6
          .copyWith(fontSize: 17, color:kPrimaryColor),
    ));
  }
}
