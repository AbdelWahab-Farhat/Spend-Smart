import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/utility/size_config.dart';

class ProfileInfoListTile extends StatelessWidget {
  const ProfileInfoListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      width: SizeConfig.viewWidth,
      height: SizeConfig.viewHeight! * .16,
      color: kBorderColor,
      child: ListTile(
        title:  Text('Abdelwahab Faraht',style: AppStyle.headLine6.copyWith(color: kSecondaryColor),),
        subtitle: Text('Abdelwahab.dev@gmail.com',style: AppStyle.body2.copyWith(color: kAccentColor),),
        leading: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}
