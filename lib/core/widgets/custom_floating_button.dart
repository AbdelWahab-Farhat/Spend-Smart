import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utility/app_style.dart';


class CustomFloatingButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final double? width;
  final String buttonText;
  const CustomFloatingButton({super.key, required this.onPressed, required this.icon, required this.buttonText, this.width});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width ?? 150,
      height: 50,
      child: FloatingActionButton(onPressed: onPressed,
        backgroundColor: kOnPrimaryColor,
        foregroundColor: kButtonTextColor,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(44),borderSide: const BorderSide(color: Colors.transparent)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(icon),
            const SizedBox(width: 8,),
            Text(buttonText,style:AppStyle.body2.copyWith(color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1.2),)
          ],
        ),
      ),
    );
  }
}
