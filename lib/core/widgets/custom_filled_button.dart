import 'package:flutter/material.dart';
import 'package:spend_smart/constants.dart';
import 'package:spend_smart/core/utility/app_style.dart';

class CustomFilledButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String titleText;
  final void Function() onTap;
  const CustomFilledButton({super.key, this.width, this.height, required this.titleText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
        width: width ?? 250,
        height: height  ?? 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: kOnPrimaryColor,
        ),
        child: Center(child: Text(titleText,style: AppStyle.headLine6.copyWith(color: Colors.white,fontSize: 18,letterSpacing: 1.3),textAlign: TextAlign.center,)),
      ),
    );
  }
}
