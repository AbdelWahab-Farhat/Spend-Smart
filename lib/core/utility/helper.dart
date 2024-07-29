import 'package:flutter/material.dart';
import 'package:spend_smart/core/utility/app_style.dart';
import 'package:spend_smart/core/utility/size_config.dart';


void showTopSnackBar(BuildContext context , String content , )  {
  SnackBar snackBar = SnackBar(content: Text(content,
  textAlign: TextAlign.center,
  style: AppStyle.headLine6.copyWith(color: Colors.white , fontSize: 18 ,fontWeight: FontWeight.w400),),
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
    elevation: 5,
    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
    margin: EdgeInsets.only(left: 10,right: 10,bottom: SizeConfig.viewHeight! - 170),
  );
   ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

