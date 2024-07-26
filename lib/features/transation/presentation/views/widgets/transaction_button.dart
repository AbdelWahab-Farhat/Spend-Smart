import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_smart/core/utility/helper.dart';
import 'package:spend_smart/core/widgets/custom_loading_widget.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/transaction_cubits/transaction_cubit/transaction_cubit.dart';

import '../../../../../core/utility/size_config.dart';
import '../../../../../core/widgets/custom_filled_button.dart';

class TransactionButton extends StatelessWidget {
  const TransactionButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    return BlocConsumer<TransactionCubit, TransactionState>(
      listener: (context, state) {
        if (state is TransactionSuccess) {
          showTopSnackBar(context, state.successMessage);
          GoRouter.of(context).pop();
        }
        else if (state is TransactionFailure) {
          showTopSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const CustomLoadingWidget();
        }
        return CustomFilledButton(titleText: 'Add an Transaction', onTap: () {
          if (transactionCubit.formKey.currentState!.validate()) {
            transactionCubit.formKey.currentState!.save();
            transactionCubit.addNewTransaction();
          }
        }, width: SizeConfig.viewWidth,);
      },
    );
  }
}