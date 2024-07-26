import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/functions/validate_function.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/transaction_cubits/transaction_cubit/transaction_cubit.dart';

import 'custom_text_form_field.dart';


class FormFields extends StatelessWidget {
  const FormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    return  Column(
      children: [
        CustomTextFormField(label: 'Amount', isAmount: true,
          validator: Validator.amountValidator,
          onSaved: (value) => transactionCubit.initAmount(double.parse(value!)),
        ),
        const SizedBox(height: 20,),
        CustomTextFormField(label: 'Description', isAmount: false,
        validator: Validator.descriptionValidator,
        onSaved: (value) => transactionCubit.initDescription(value!),
        ),
      ],
    );
  }
}
