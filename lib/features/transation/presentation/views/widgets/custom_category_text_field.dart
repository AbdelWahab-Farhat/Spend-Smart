import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/transaction_cubits/category_cubit/category_cubit.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/bottom_sheet_body.dart';

import '../../viewModel/transaction_cubits/transaction_cubit/transaction_cubit.dart';

class CustomCategoryTextField extends StatelessWidget {
  final BuildContext ctx;

  const CustomCategoryTextField({super.key, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        TextEditingController controllerName = TextEditingController();
        TransactionCubit transactionCubit = context.read<TransactionCubit>();
        controllerName.text = transactionCubit.category?.categoryName ?? "";
        return TextField(
          controller: controllerName,
          onTapAlwaysCalled: false,
          keyboardType: TextInputType.none,
          decoration: const InputDecoration(
              labelText: 'Category Name',
              hintText: 'Select Category'),
          onTap: () => categorySheet(ctx),
        );
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
      builder: (context) =>
          MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: BlocProvider.of<CategoryCubit>(ctx),
              ),
              BlocProvider.value(
                value: BlocProvider.of<TransactionCubit>(ctx),
              ),
            ],
            child: const BottomSheetBody(),
          ),
    );
  }
}