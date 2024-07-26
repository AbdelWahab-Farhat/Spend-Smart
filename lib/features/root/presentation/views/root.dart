import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spend_smart/core/utility/app_assets.dart';
import 'package:spend_smart/core/utility/app_strings.dart';
import 'package:spend_smart/features/home/presentation/views/home_view.dart';
import 'package:spend_smart/features/report/presentation/view/report_view.dart';
import 'package:spend_smart/features/setting/presentation/views/setting_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final NotchBottomBarController notchBottomBarController = NotchBottomBarController(index: 1);
  List<Widget> views = [
    const ReportView(),
    const HomeView(),
    const SettingView(),
  ];

  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedNotchBottomBar(
        removeMargins: true,
        showShadow: true,
        bottomBarHeight: 60, // Increased height for better usability
        notchBottomBarController: notchBottomBarController,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: SvgPicture.asset(AppAssets.REPORT_BLACK_ICON_PATH),
            activeItem: SvgPicture.asset(AppAssets.REPORT_ICON_PATH),
            itemLabel: AppStrings.ROOT_FIRST_ITEM_TEXT,
          ),
          BottomBarItem(
            inActiveItem: SvgPicture.asset(AppAssets.HOME_BLACK_ICON_PATH),
            activeItem: SvgPicture.asset(AppAssets.HOME_ICON_PATH),
            itemLabel: AppStrings.ROOT_SECOND_ITEM_TEXT,
          ),
          BottomBarItem(
            inActiveItem: SvgPicture.asset(AppAssets.SETTING_BLACK_ICON_PATH),
            activeItem: SvgPicture.asset(AppAssets.SETTING_ICON_PATH),
            itemLabel: AppStrings.ROOT_THIRD_ITEM_TEXT,
          ),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        kIconSize: 25,
        kBottomRadius: 10,
      ),
      body: views[currentIndex],
    );
  }
}
