

import 'package:flutter/cupertino.dart';
// CLASS PROVIDE YOU WITH SCREEN WIDTH AND SCREEN HEIGHT'
class SizeConfig {

  static double? viewWidth;
  static double? viewHeight;


  void initSizeConfig(BuildContext context){
    viewHeight = MediaQuery.sizeOf(context).height;
    viewWidth = MediaQuery.sizeOf(context).width;
  }
}