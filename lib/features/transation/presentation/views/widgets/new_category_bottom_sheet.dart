import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/utility/app_strings.dart';
import 'package:spend_smart/core/widgets/custom_error_widget.dart';
import 'package:spend_smart/core/widgets/custom_loading_widget.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/transaction_cubits/category_cubit/category_cubit.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/utility/size_config.dart';
import 'bottom_sheet_grid_view.dart';

class NewCategoryBottomSheet extends StatefulWidget {
  const NewCategoryBottomSheet({super.key});

  @override
  State<NewCategoryBottomSheet> createState() => _NewCategoryBottomSheetState();
}

class _NewCategoryBottomSheetState extends State<NewCategoryBottomSheet> {
  @override
  void initState() {
    context.read<CategoryCubit>().getDefaultCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const CustomLoadingWidget();
        }
        else if (state is CategoryFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        }
          return Container(
          width: SizeConfig.viewWidth,
          height: SizeConfig.viewHeight! * 0.45,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
          child: Column(
            children: [
              Text(
                AppStrings.TRANSACTION_CHOOSE_CATEGORY_TEXT,
                style: AppStyle.body2.copyWith(
                    letterSpacing: 1.5, fontSize: 13),
              ),
              Expanded(
                child: BottomSheetGridView(
                  crossAxisNumber: 4,
                  isNewCategorySheet: true,
                  categories: context
                      .read<CategoryCubit>()
                      .categories!,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
