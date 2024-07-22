import 'package:flutter/material.dart';
import 'package:spend_smart/core/utility/app_strings.dart';
import 'package:spend_smart/core/widgets/custom_date_picker.dart';
import 'package:spend_smart/core/widgets/custom_floating_button.dart';
import '../../../../../core/utility/app_style.dart';
import 'list_view_details.dart';
import 'over_view_bar.dart';
import 'report_app_bar.dart';

class ReportViewBody extends StatelessWidget {
  const ReportViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const ReportAppBar(),
      floatingActionButton: CustomFloatingButton(onPressed: (){}, icon: Icons.download, buttonText: 'Download report',width: 200,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomDatePicker(),
            const SizedBox(height: 8,),
            Text(
                AppStrings.REPORT_OVERVIEW_TEXT,
                style: AppStyle.headLine6.copyWith(letterSpacing: 1.5,fontSize: 15,fontWeight: FontWeight.w600)
            ),
            OverViewBar(expenses: const [200,250,210,400], colors: const [Colors.black,Colors.blue,Colors.red,Colors.yellow],),

            Text(
                AppStrings.REPORT_DETAILS_TEXT,
                style: AppStyle.headLine6.copyWith(letterSpacing: 1.5,fontSize: 15,fontWeight: FontWeight.w600),
            ),
             const ListViewDetails()
          ],
        ),
      ),
    );
  }
}






