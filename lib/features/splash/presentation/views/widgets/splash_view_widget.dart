import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../constants.dart';
import '../../../../../core/utility/app_assets.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/app_style.dart';

class SplashViewWidget extends StatelessWidget {
  const SplashViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.LOGO_PATH),
          const SizedBox(
            height: 24,
          ),
          Text(
            AppStrings.APP_NAME_TEXT,
            style: AppStyle.body2
                .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            AppStrings.SPLASH_VIEW_SUB_TITLE_TEXT,
            style: AppStyle.body2.copyWith(color: kAccentColor),
          ),
        ],
      ),
    );
  }
}
