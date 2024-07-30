import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/functions/validate_function.dart';
import 'package:spend_smart/core/utility/size_config.dart';
import 'package:spend_smart/core/widgets/custom_app_bar.dart';
import 'package:spend_smart/features/setting/presentation/views/widgets/edit_category_button.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/custom_text_form_field.dart';

import '../../../../../core/models/category/category.dart';
import '../../viewModel/manage_categories_cubit/manage_categories_cubit.dart';

class EditCategoryViewBody extends StatelessWidget {
  final Category category;
  const EditCategoryViewBody({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    var manageCategoriesCubit = context.read<ManageCategoriesCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Edit Category'),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(
          children: [
            Form(
              key: manageCategoriesCubit.formKey,
              child: Row(
                children: [
                  const SizedBox(width: 18,),
                  Expanded(child: CustomTextFormField(
                    label: 'Category Name', isAmount: false,
                    validator: Validator.newCategoryNameValidator,
                    onSaved: (name) => category.categoryName = name!,
                  )),
                ],
              ),
            ),
            const Spacer(),
            EditCategoryButton(category: category,),
            SizedBox(height: SizeConfig.viewHeight! * .10,)
          ],
        ),
      ),
    );
  }
}
