import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spend_smart/core/utility/app_assets.dart';
import 'package:spend_smart/core/utility/size_config.dart';

import 'login_button.dart';
import 'login_info_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(top: SizeConfig.viewHeight! * 0.25),
          child: Column(
            children: [
              // test
              SvgPicture.asset(AppAssets.LOGO_PATH),
              const SizedBox(height: 12,),
              const LoginInfoSection(),
              const LoginButton()
            ],
          ),
        ),
      ),
    );
  }
}

