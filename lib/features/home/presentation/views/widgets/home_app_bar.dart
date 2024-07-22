import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utility/app_assets.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/utility/size_config.dart';
import 'app_bar_actions.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 32,
          height: 32,
          child: SvgPicture.asset(
            AppAssets.LOGO_PATH,
            fit: BoxFit.contain,
          ),
        ),
      ),
      title: Text(
        'Spend Smart',
        style: AppStyle.headLine6.copyWith(fontSize: 24,fontWeight: FontWeight.bold),
      ),
      actions: const [AppBarActions()],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(SizeConfig.viewWidth!, kToolbarHeight);
}
