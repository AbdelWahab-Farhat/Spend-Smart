import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/features/transation/data/repo/category_repo/category_repo_impl.dart';
import 'package:spend_smart/features/transation/data/repo/transaction_repo/transaction_repo_impl.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/transaction_cubits/category_cubit/category_cubit.dart';
import 'package:spend_smart/features/transation/presentation/viewModel/transaction_cubits/transaction_cubit/transaction_cubit.dart';
import 'package:spend_smart/features/transation/presentation/views/widgets/transaction_view_body.dart';


class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TransactionCubit(TransactionRepoImpl()),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(CategoryRepoImpl()),
        ),
      ],
      child: const TransactionViewBody(),
    );
  }
}
