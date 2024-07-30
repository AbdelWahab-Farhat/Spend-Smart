import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/models/transaction/transaction.dart';
import 'package:spend_smart/core/models/transaction/transaction_utils.dart';
import 'package:spend_smart/core/widgets/custom_error_widget.dart';
import 'package:spend_smart/core/widgets/custom_loading_widget.dart';
import 'package:spend_smart/core/widgets/custom_warning_widget.dart';
import 'package:spend_smart/features/home/presentation/viewModel/home_cubit.dart';
import '../../../../../constants.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/widgets/custom_expense_item_widget.dart';

class ListViewExpenses extends StatelessWidget {
  // Today == 1 , yesterday == 2;
  final int type;
  final String dayName;

  const ListViewExpenses({
    super.key,
    required this.dayName,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is HomeSuccess) {
          List<Transaction> transactions = state.transactions;
          var today = TransactionUtils.getTodayExpenses(transactions);
          var yesterday = TransactionUtils.getYesterdayExpenses(transactions);

          if (today.isEmpty && yesterday.isEmpty) {
            return const CustomWarningWidget(text: 'No expenses');
          }

          List<Transaction> selectedTransactions = type == 1 ? today : yesterday;

          if (selectedTransactions.isEmpty) {
            return const SizedBox();
          } else {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: kBorderColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  dayAndFullExpenseRow(selectedTransactions),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: selectedTransactions.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: CustomExpenseItemWidget(transaction: selectedTransactions[index]),
                    ),
                  ),
                ],
              ),
            );
          }
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }

  Row dayAndFullExpenseRow(List<Transaction> transactions) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          dayName,
          style: AppStyle.body2,
        ),
        Text(
          '- ${AppStrings.currency} ${TransactionUtils.countDayExpenseAmount(transactions).toStringAsFixed(0)}',
          maxLines: 1,
          overflow: TextOverflow.fade,
          softWrap: true,
        ),
      ],
    );
  }
}
