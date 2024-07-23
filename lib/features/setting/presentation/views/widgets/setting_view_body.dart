import 'package:flutter/material.dart';

import 'profile_info_list_tile.dart';
import 'setting_app_bar.dart';
import 'setting_list_view.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      appBar: SettingAppBar(),
      body: Column(
        children: [
          ProfileInfoListTile(),
          SettingListView()
        ],
      ),
    );
  }
}




