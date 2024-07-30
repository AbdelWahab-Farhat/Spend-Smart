import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_smart/core/models/category/category.dart';
import 'package:spend_smart/core/utility/app_router.dart';
import 'package:spend_smart/features/setting/presentation/viewModel/manage_categories_cubit/manage_categories_cubit.dart';
import '../../../../../core/widgets/custom_filled_button.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../../../../core/utility/helper.dart';

class EditCategoryButton extends StatelessWidget {
  final Category category;

  const EditCategoryButton({
    super.key, required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageCategoriesCubit, ManageCategoriesState>(
      listener: (context, state) {
        if (state is ManageCategoriesSuccess) {
          showTopSnackBar(context, 'Category edited Successfully');
          GoRouter.of(context).pushReplacement(AppRouter.SETTING_VIEW_PATH); // Pop the route
        }
      },
      builder: (context, state) {
        var manageCategoriesCubit = context.read<ManageCategoriesCubit>();

        if (state is ManageCategoriesLoading) {
          return const CustomLoadingWidget();
        }

        return CustomFilledButton(
          titleText: 'Edit Category',
          onTap: () async {
            if (manageCategoriesCubit.formKey.currentState!.validate()) {
              manageCategoriesCubit.formKey.currentState!.save();
              await manageCategoriesCubit.editCategory(category);
            }
          },
        );
      },
    );
  }
}
