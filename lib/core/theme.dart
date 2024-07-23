import 'package:flutter/material.dart';

import '../constants.dart';


abstract class CustomTheme{
  static const InputDecorationTheme inputDecorationTheme =  InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: Colors.blue),
    enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: kBorderColor)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kOnPrimaryColor,width: 2)),
  );

}