import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/widgets/custom_loading_widget.dart';
import 'package:spend_smart/features/setting/presentation/viewModel/setting_cubit/setting_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/utility/size_config.dart';

class ProfileInfoListTile extends StatelessWidget {
  const ProfileInfoListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        if (state is SettingSuccess) {
          return Container(
          padding: const EdgeInsets.only(top: 20,left: 10),
          width: SizeConfig.viewWidth,
          height: SizeConfig.viewHeight! * .16,
          color: kBorderColor,
          child: ListTile(
            title: Text(state.user.displayName,
              style: AppStyle.headLine6.copyWith(color: kSecondaryColor),),
            subtitle: Text(state.user.email,
              style: AppStyle.body2.copyWith(color: kAccentColor),),
          ),
        );
        }
        else if (state is SettingFailure) {
          return const SizedBox();
        }
        else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
