import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utility/app_assets.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/app_style.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 52 , vertical: 52),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey)
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.GOOGLE_ICON_PATH),
          const SizedBox(width: 20,),
          Center(child: Text(AppStrings.LOGIN_BUTTON_TEXT,style: AppStyle.headLine6.copyWith(fontSize: 16),))
        ],
      ),
    );
  }
}
