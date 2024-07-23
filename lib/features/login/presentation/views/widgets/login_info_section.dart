import 'package:flutter/material.dart';

import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/app_style.dart';

class LoginInfoSection extends StatelessWidget {
  const LoginInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppStrings.APP_NAME_TEXT,style: AppStyle.headLine6.copyWith(fontSize: 24,fontWeight: FontWeight.bold),),
        const Padding(
          padding: EdgeInsets.only(top: 40,bottom: 8),
          child: Text(AppStrings.LOGIN_TITLE_TEXT,style: AppStyle.headLine6,),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(AppStrings.LOGIN_SUB_TITLE_TEXT,style: AppStyle.body2,textAlign: TextAlign.center),
        )
      ],
    );
  }
}
