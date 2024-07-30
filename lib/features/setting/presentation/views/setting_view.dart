import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/features/setting/data/repo/setting_repo/setting_repo_impl.dart';
import 'package:spend_smart/features/setting/presentation/views/widgets/setting_view_body.dart';

import '../viewModel/setting_cubit/setting_cubit.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(SettingRepoImpl()),
      child: const SettingViewBody(),
    );
  }
}
