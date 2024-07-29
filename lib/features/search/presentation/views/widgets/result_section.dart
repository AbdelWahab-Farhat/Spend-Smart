import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/widgets/custom_expense_item_widget.dart';

class ResultSection extends StatelessWidget {
  final String dayName;
  const ResultSection({
    super.key, required this.dayName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      decoration: BoxDecoration(
          border: Border.all(color: kBorderColor),
          borderRadius: BorderRadius.circular(8)
      ),
      child:  Column(
        children: [
          dayAndFullExpenseRow(),
          const SizedBox(height: 8,),
          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemCount: 5,
          //   itemBuilder: (context, index) =>  const Padding(
          //     padding: EdgeInsets.only(top: 10 , bottom: 10),
          //      child: CustomExpenseItemWidget(transaction: null,),
          //   ),
          // )
          
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

