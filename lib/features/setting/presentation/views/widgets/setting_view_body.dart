import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/features/setting/presentation/viewModel/setting_cubit/setting_cubit.dart';

import 'profile_info_list_tile.dart';
import 'setting_app_bar.dart';
import 'setting_list_view.dart';

class SettingViewBody extends StatefulWidget {
  const SettingViewBody({super.key});

  @override
  State<SettingViewBody> createState() => _SettingViewBodyState();
}

class _SettingViewBodyState extends State<SettingViewBody> {
  @override
  void initState() {
    context.read<SettingCubit>().fetchUser();
    super.initState();
  }
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




