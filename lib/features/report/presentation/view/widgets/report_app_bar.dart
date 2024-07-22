import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utility/app_assets.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/utility/size_config.dart';
import '../../../../home/presentation/views/widgets/app_bar_actions.dart';

class ReportAppBar extends StatelessWidget implements PreferredSizeWidget{
  const ReportAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Statistics',
        style: AppStyle.headLine6
            .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      actions: const [
        AppBarActions()
      ],
    );
  }

  @override
  Size get preferredSize =>  Size(SizeConfig.viewWidth!, kToolbarHeight);
}

