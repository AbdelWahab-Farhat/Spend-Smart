import 'package:flutter/material.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/bottom_sheet_body.dart';


class CustomCategoryTextField extends StatelessWidget {
  const CustomCategoryTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.none,
      decoration: const InputDecoration(
          labelText: 'Category Name',
          hintText: 'Select Category'),
      onTap: ()=> categorySheet(context),
      onTapOutside: (event) {

      },
    );
  }

  void categorySheet(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        backgroundColor: const Color(0xffFAFAFA),
        enableDrag: true,
        elevation: 40,
        showDragHandle: true,
        context: context,
        builder: (context) => const BottomSheetBody()
    );
  }
}
