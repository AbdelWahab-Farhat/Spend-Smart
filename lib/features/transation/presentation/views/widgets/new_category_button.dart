import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_smart/core/models/category/category.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/icon_picker_cubit/icon_picker_cubit.dart';
import 'package:uuid/uuid.dart';
import '../../../../../core/utility/app_router.dart';
import '../../../../../core/utility/helper.dart';
import '../../../../../core/widgets/custom_filled_button.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../viewModel/new_category_cubit/new_category_cubit.dart';



class NewCategoryButton extends StatelessWidget {
  const NewCategoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCategoryCubit, NewCategoryState>(
      listener: (context, state) {
        if (state is NewCategorySuccess) {
          showTopSnackBar(context, 'New Category Added Successfully');
          GoRouter.of(context).pushReplacement(AppRouter.ROOT_PATH);
        }
      },
      builder: (context, state) {
        var newCategoryCubit = context.read<NewCategoryCubit>();
        var iconPickerCubit = context.read<IconPickerCubit>();
        if (state is NewCategoryLoading) {
          return const CustomLoadingWidget();
        }
        return CustomFilledButton(
          titleText: 'Add new Category', onTap: () async {
                if(newCategoryCubit.formKey.currentState!.validate()) {
                  newCategoryCubit.formKey.currentState!.save();
                  Category category = Category(categoryID: const Uuid().v8(),
                      categoryName: newCategoryCubit.categoryName!,
                      svgIconImg: iconPickerCubit.newCategoryValue!.svgIconImg,
                      categoryRGBOColor: iconPickerCubit.newCategoryValue!.categoryRGBOColor
                  );
                  await newCategoryCubit.addNewCategory(category);
                }
            }
          ,);
      },
    );
  }
}
