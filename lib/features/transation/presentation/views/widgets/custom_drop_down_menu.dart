import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:spend_smart/constants.dart';
import '../../../../../core/models/transaction.dart';
import '../../../../../core/utility/app_assets.dart';


class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({super.key});

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  TransactionEnum? transactionEnum;
  List<DropdownMenuItem<TransactionEnum>> items = [
    DropdownMenuItem(
      value: TransactionEnum.income,
      child: Text(TransactionEnum.income.name),
    ),
    DropdownMenuItem(
      value: TransactionEnum.expense,
      child: Text(TransactionEnum.expense.name,),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kBorderColor),
        borderRadius: BorderRadius.circular(6)
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
            isExpanded: true,
            hint: const Text('Select type'),
          buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 20),
              decoration: BoxDecoration()
          ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: kBorderColor)
              )
            ),
            onChanged: (value) {
              transactionEnum = value;
              setState(() {
              });
            },
            iconStyleData: IconStyleData(icon: SvgPicture.asset(AppAssets.DROP_DOWN_ARROW_ICON_PATH,width:10,height:10,fit: BoxFit.contain,)),
            value: transactionEnum,
            items: items,
        ),
      ),
    );
  }
}
