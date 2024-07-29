import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/category/category_utils.dart';
import '../../../../../core/models/transaction/transaction.dart';
import '../../../../../core/models/transaction/transaction_utils.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../viewModel/report_cubit/report_cubit.dart';
import 'over_view_bar.dart';
class BlocBuilderBar extends StatelessWidget {
  const BlocBuilderBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        if (state is ReportSuccess) {
          if (state.transactions.isEmpty) {
            return const SizedBox(height: 50,);
          }
          Map<String, List<Transaction>> categorizedTransactions =
          TransactionUtils.expensesByCategory(state.transactions);
          List<double> totalExpenses = categorizedTransactions.entries.map((entry) {
            return entry.value.fold(0.0, (sum, transaction) {
              return sum + transaction.amount;
            });
          }).toList();
          List<Color> totalColors = categorizedTransactions.entries.map((entry) {
            List<num> rgbo =CategoryUtils.getRGBO(RGBO_STR: entry.value.first.category.categoryRGBOColor);
            return Color.fromRGBO(rgbo[0].toInt(), rgbo[1].toInt(), rgbo[2].toInt(), rgbo[3].toDouble());
          },).toList();
          return OverViewBar(
              expenses: totalExpenses,
              colors: totalColors
          );
        } else if (state is ReportFailure) {
          return Center(child: Text('Failed to load report: ${state.errMessage}'));
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
