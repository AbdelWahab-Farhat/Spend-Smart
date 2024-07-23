import 'package:flutter/material.dart';
import 'package:spend_smart/core/utility/size_config.dart';
import 'package:spend_smart/core/widgets/custom_filled_button.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'new_category_icon_picker.dart';

class NewCategoryBody extends StatelessWidget {
  const NewCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add new Category'),
      body: Padding(
        padding: const EdgeInsets.only(left:16 ,right:16,top: 20),
        child: Column(
          children: [
            const Row(
              children: [
                NewCategoryIconPicker(),
                SizedBox(width: 18,),
                Expanded(child: CustomTextFormField(label: 'Category Name', isAmount: false)),
              ],
            ),
            const Spacer(),
            CustomFilledButton(titleText: 'Add new Category', onTap: (){},),
            SizedBox(height: SizeConfig.viewHeight!* .10,)
          ],
        ),
      ),
    );
  }
}

