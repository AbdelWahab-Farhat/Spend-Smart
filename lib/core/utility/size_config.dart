

import 'package:flutter/cupertino.dart';

class SizeConfig {

  static double? viewWidth;
  static double? viewHeight;


  void initSizeConfig(BuildContext context){
    viewHeight = MediaQuery.sizeOf(context).height;
    viewWidth = MediaQuery.sizeOf(context).width;
  }
}