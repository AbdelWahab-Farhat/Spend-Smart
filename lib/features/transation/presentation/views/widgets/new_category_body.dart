import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/functions/validate_function.dart';
import 'package:spend_smart/core/utility/size_config.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/new_category_cubit/new_category_cubit.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'new_category_button.dart';
import 'new_category_icon_picker.dart';

class NewCategoryBody extends StatelessWidget {
  const NewCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    var newCategoryCubit = context.read<NewCategoryCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add new Category'),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(
          children: [
            Form(
              key: newCategoryCubit.formKey,
              child: Row(
                children: [
                  NewCategoryIconPicker(ctx: context,),
                  const SizedBox(width: 18,),
                   Expanded(child: CustomTextFormField(
                      label: 'Category Name', isAmount: false,
                    validator: Validator.validateNewCategoryName,
                    onSaved: (name) => newCategoryCubit.categoryName = name,
                  )),
                ],
              ),
            ),
            const Spacer(),
            const NewCategoryButton(),
            SizedBox(height: SizeConfig.viewHeight! * .10,)
          ],
        ),
      ),
    );
  }
}


