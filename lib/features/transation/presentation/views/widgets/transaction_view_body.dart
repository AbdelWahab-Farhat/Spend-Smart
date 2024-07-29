import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/utility/size_config.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/transaction_cubits/category_cubit/category_cubit.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/transaction_cubits/transaction_cubit/transaction_cubit.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/custom_drop_down_menu.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/custom_category_text_field.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/transaction_button.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'form_fields.dart';


class TransactionViewBody extends StatefulWidget {

    const TransactionViewBody({super.key});

  @override
  State<TransactionViewBody> createState() => _TransactionViewBodyState();
}

class _TransactionViewBodyState extends State<TransactionViewBody> {
  @override
  void initState() {
    context.read<CategoryCubit>().addDefaultCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TransactionCubit transactionCubit = context.read<TransactionCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add new Transaction',),
      body:   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Form(
            key: transactionCubit.formKey,
            child: Column(
              children: [
                const CustomDropDownMenu(),
                const SizedBox(height: 20,),
                 CustomCategoryTextField(ctx: context,),
                const SizedBox(height: 20,),
                const FormFields(),
                SizedBox(height: SizeConfig.viewHeight!* .40,),
                const TransactionButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





