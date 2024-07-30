import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spend_smart/core/utility/helper.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';


class SettingListViewItem extends StatelessWidget {
  final String title;
  final String leadingIconSvgPath;
  final String  viewPath;
  final bool?  isLogout;
  const SettingListViewItem({super.key, required this.title, required this.leadingIconSvgPath, required this.viewPath, this.isLogout});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isLogout != null) {
          FirebaseAuth.instance.signOut();
          GoogleSignIn().signOut();
        }
        else if (viewPath == '') {
          showSnackBar(context, 'The feature Not Available at the moment');
          return;
        }

        GoRouter.of(context).push(viewPath);
      },
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
