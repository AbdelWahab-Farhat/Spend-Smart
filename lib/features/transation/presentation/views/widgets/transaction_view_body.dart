import 'package:flutter/material.dart';
import 'package:spend_smart/core/utility/size_config.dart';
import 'package:spend_smart/core/widgets/custom_filled_button.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/custom_drop_down_menu.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/custom_category_text_field.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/custom_app_bar.dart';


class TransactionViewBody extends StatelessWidget {

    const TransactionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add new Transaction',),
      body:   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const CustomDropDownMenu(),
              const SizedBox(height: 20,),
              const CustomCategoryTextField(),
              const SizedBox(height: 20,),
              const CustomTextFormField(label: 'Amount', isAmount: true),
              const SizedBox(height: 20,),
              const CustomTextFormField(label: 'Description', isAmount: false),
              const SizedBox(height: 20,),
              CustomFilledButton(titleText: 'Add an Transaction', onTap: (){},width: SizeConfig.viewWidth,)
            ],
          ),
        ),
      ),
    );
  }
}


