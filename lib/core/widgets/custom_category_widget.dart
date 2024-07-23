import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomCategoryWidget extends StatelessWidget {
  final String iconSvgPath;
  final double? width;
  final double? height;
  final Color iconBackgroundColor;
  const CustomCategoryWidget({super.key, required this.iconSvgPath, required this.iconBackgroundColor, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: width ?? 42,
      height:height ?? 42,
      decoration: BoxDecoration(
        color: iconBackgroundColor,
        shape: BoxShape.circle
      ),
      child: SvgPicture.asset(iconSvgPath),
    );
  }
}
