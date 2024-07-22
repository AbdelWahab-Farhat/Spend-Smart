import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spend_smart/constants.dart';
import 'package:spend_smart/core/utility/app_assets.dart';
import 'package:spend_smart/core/utility/app_strings.dart';
import 'package:spend_smart/core/utility/app_style.dart';
import 'package:spend_smart/core/widgets/custom_date_picker.dart';
import 'package:spend_smart/core/widgets/custom_floating_button.dart';
import 'package:spend_smart/features/home/presentation/views/widgets/list_view_expenses_section.dart';
import 'expenses_state_section.dart';
import 'home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFloatingButton(onPressed: (){}, icon: Icons.add_circle, buttonText: AppStrings.HOME_BUTTON_TEXT),
        appBar: const HomeAppBar(),
        body:  const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                CustomDatePicker(),
                SizedBox(
                  height: 10,
                ),
                ExpensesStateSection(),
                SizedBox(height: 16,),
                ListViewExpensesSection(dayName: AppStrings.HOME_TODAY_TEXT,),
                SizedBox(height: 10,),
                ListViewExpensesSection(dayName: AppStrings.HOME_YESTERDAY_TEXT,),
              ],
            ),
          ),
        ));
  }
}




