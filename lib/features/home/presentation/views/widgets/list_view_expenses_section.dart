import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/app_style.dart';
import 'list_view_expenses_item.dart';

class ListViewExpensesSection extends StatelessWidget {
  final String dayName;
  const ListViewExpensesSection({
    super.key, required this.dayName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      decoration: BoxDecoration(
          border: Border.all(color: kBorderColor),
          borderRadius: BorderRadius.circular(8)
      ),
      child:  Column(
        children: [
        dayAndFullExpenseRow(),
        const SizedBox(height: 8,),
         ListView.builder(
           shrinkWrap: true,
           physics: const NeverScrollableScrollPhysics(),
           itemCount: 5,
           itemBuilder: (context, index) =>  const Padding(
             padding: EdgeInsets.only(top: 10 , bottom: 10),
             child: ListViewExpensesItem(),
           ),

         )
      ],),
    );
  }


    Row dayAndFullExpenseRow() {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(dayName,style: AppStyle.body2,),
            Text('- ${AppStrings.currency} 1839')
          ],);
    }
}

