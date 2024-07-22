import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomCategoryWidget extends StatelessWidget {
  final String iconSvgPath;
  final Color iconBackgroundColor;
  const CustomCategoryWidget({super.key, required this.iconSvgPath, required this.iconBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: iconBackgroundColor,
      child: SvgPicture.asset(iconSvgPath),
    );
  }
}
