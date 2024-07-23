import 'package:flutter/material.dart';

import '../utility/app_style.dart';
import '../utility/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const CustomAppBar({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffF5F5F5),
      title: Text(
        title,
        style: AppStyle.headLine6.copyWith(
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(SizeConfig.viewWidth!,kToolbarHeight);
}
