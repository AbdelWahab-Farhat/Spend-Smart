import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_smart/constants.dart';
import 'package:spend_smart/core/utility/app_assets.dart';
import 'package:spend_smart/core/utility/app_router.dart';
import 'package:spend_smart/core/utility/app_strings.dart';
import 'package:spend_smart/core/utility/app_style.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    changeViewDepandsOnAuthState();
  }

  void changeViewDepandsOnAuthState() {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        FirebaseAuth.instance.authStateChanges().listen(
          (event) {
            if (event == null) {
               GoRouter.of(context).pushReplacement(AppRouter.ROOT_PATH);
            }
            else {
              GoRouter.of(context).pushReplacement(AppRouter.LOGIN_VIEW_PATH);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
      ),
    );
  }
}
