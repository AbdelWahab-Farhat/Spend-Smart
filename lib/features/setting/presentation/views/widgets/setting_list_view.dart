import 'package:flutter/material.dart';
import 'package:spend_smart/core/utility/app_router.dart';
import 'package:spend_smart/features/setting/presentation/views/widgets/setting_list_view_item.dart';
import '../../../../../core/utility/app_assets.dart';
import '../../../../../core/utility/app_strings.dart';

class SettingListView extends StatelessWidget {
  const SettingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: settingList.length,
      itemBuilder: (context, index) => settingList[index],);
  }
}

List<Widget> settingList = [
  const SettingListViewItem(title: AppStrings.SETTING_CATEGORY_TEXT, leadingIconSvgPath: AppAssets.MANGE_CATEGORY_ICON_PATH, viewPath:
     AppRouter.MANGE_CATEGORIES_VIEW_PATH
  ),
  SettingListViewItem(title: AppStrings.SETTING_PDF_TEXT, leadingIconSvgPath: AppAssets.PDF_ICON_PATH, viewPath: ''),
  SettingListViewItem(title: AppStrings.SETTING_CURRENCY_TEXT, leadingIconSvgPath: AppAssets.CURRENCY_ICON_PATH, viewPath: ''),
  SettingListViewItem(title: AppStrings.SETTING_LANGUAGE_TEXT, leadingIconSvgPath: AppAssets.LANGUAGE_ICON_PATH, viewPath: ''),
  SettingListViewItem(title: AppStrings.SETTING_QUESTIONS_TEXT, leadingIconSvgPath: AppAssets.ASKED_QUSTIONS_ICON_PATH, viewPath: ''),
  SettingListViewItem(title: AppStrings.SETTING_LOGOUT_TEXT, leadingIconSvgPath: AppAssets.LOGOUT_ICON_PATH, viewPath: ''),
];
