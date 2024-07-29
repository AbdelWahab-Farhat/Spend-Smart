
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/models/transaction/transaction.dart';
import 'package:spend_smart/core/models/transaction/transaction_utils.dart';
import 'package:spend_smart/core/widgets/custom_error_widget.dart';
import 'package:spend_smart/core/widgets/custom_loading_widget.dart';
import 'package:spend_smart/core/widgets/custom_warning_widget.dart';
import 'package:spend_smart/features/report/presentation/viewModel/pdf_cubit/pdf_cubit.dart';
import 'package:spend_smart/features/report/presentation/viewModel/report_cubit/report_cubit.dart';
import 'list_tile_details.dart';

class ListViewDetails extends StatelessWidget {
  const ListViewDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        if (state is ReportFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is ReportSuccess) {
          if (state.transactions.isEmpty) {
            return const CustomWarningWidget(text: 'No Transaction In this Date');
          }
          Map<String, List<Transaction>> categorizedTransactions =
          TransactionUtils.expensesByCategory(state.transactions);
          List<MapEntry<String, List<Transaction>>> categorizedEntries = categorizedTransactions.entries.toList();
          context.read<PdfCubit>().initCategorizedTransactions(categorizedTransactions);
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categorizedTransactions.values.length,
            itemBuilder: (context, index) {
              var categoryID = categorizedEntries[index].key;
              var transactions = categorizedEntries[index].value;
              return ListTileDetails(
              transactionByCategory: transactions,
                percent: TransactionUtils.countTransactionPercent(categorizedTransactions, categoryID),
            );
            },
          );
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
