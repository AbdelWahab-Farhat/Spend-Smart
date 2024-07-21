import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_smart/core/utility/app_router.dart';
import 'package:spend_smart/core/utility/helper.dart';
import 'package:spend_smart/features/Login/presentation/viewModel/login_cubit/login_cubit.dart';
import '../../../../../core/utility/app_assets.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showTopSnackBar(context, 'Login Successful');
          GoRouter.of(context).pushReplacement(AppRouter.HOME_VIEW_PATH);
        }
        else if (state is LoginFailure) {
          showTopSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 52, vertical: 52),
            child: CustomLoadingWidget(),
          );
        }
        return GestureDetector(
          onTap: context.read<LoginCubit>().loginAuth,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 52, vertical: 52),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey)
            ),
            child: buttonContent(),
          ),
        );
      },
    );
  }

  Row buttonContent() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.GOOGLE_ICON_PATH),
              const SizedBox(width: 20,),
              Center(child: Text(AppStrings.LOGIN_BUTTON_TEXT,
                style: AppStyle.headLine6.copyWith(fontSize: 16),))
            ],
          );
  }
}
