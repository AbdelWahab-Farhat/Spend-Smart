import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_smart/core/utility/app_router.dart';

import '../../../../../core/utility/app_assets.dart';


class AppBarActions extends StatelessWidget {
  const AppBarActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          GestureDetector(
              onTap: () => GoRouter.of(context).push(AppRouter.SEARCH_VIEW_PATH),
              child: SvgPicture.asset(AppAssets.SEARCH_ICON_PATH)),
          const SizedBox(width: 20,),
          const CircleAvatar(
            child: Text('M'),
          )
        ],
      ),
    );
  }
}

