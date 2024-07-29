import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_smart/core/utility/app_router.dart';
import 'package:spend_smart/core/utility/app_strings.dart';
import 'package:spend_smart/core/widgets/custom_floating_button.dart';
import 'package:spend_smart/features/home/presentation/viewModel/home_cubit.dart';
import 'package:spend_smart/features/home/presentation/views/widgets/list_view_expenses.dart';
import 'expenses_state_section.dart';
import 'home_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<HomeCubit>().getUserTransaction();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFloatingButton(
            onPressed: ()=> GoRouter.of(context).push(AppRouter.TRANSACTION_VIEW_PATH),
            icon: Icons.add_circle,
            buttonText: AppStrings.HOME_BUTTON_TEXT),
        appBar: const HomeAppBar(),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ExpensesStateSection(),
                SizedBox(
                  height: 10,
                ),
                ListViewExpenses(dayName: AppStrings.HOME_TODAY_TEXT, type: 1,),
                SizedBox(
                  height: 20,
                ),
                ListViewExpenses(dayName: AppStrings.HOME_YESTERDAY_TEXT, type: 2,),
              ],
            ),
          ),
        ));
  }
}
