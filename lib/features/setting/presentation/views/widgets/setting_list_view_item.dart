import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';


class SettingListViewItem extends StatelessWidget {
  final String title;
  final String leadingIconSvgPath;
  final void Function() onTap;
  const SettingListViewItem({super.key, required this.title, required this.leadingIconSvgPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: SvgPicture.asset(leadingIconSvgPath),
          title: Text(title,style: AppStyle.headLine6.copyWith(fontSize: 17,fontWeight: FontWeight.w700),),
          trailing: const Icon(Icons.arrow_forward_ios,color: kBorderColor,),
        ),
      ),
    );
  }
}
