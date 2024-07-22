import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/utility/size_config.dart';

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBorderColor,
      title: Text(
        'Setting',
        style: AppStyle.headLine6
            .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize =>  Size(SizeConfig.viewWidth! , kToolbarHeight);
}
