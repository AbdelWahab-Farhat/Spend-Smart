import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/models/transaction/transaction_utils.dart';
import 'package:spend_smart/core/widgets/custom_error_widget.dart';
import 'package:spend_smart/core/widgets/custom_loading_widget.dart';
import 'package:spend_smart/features/home/presentation/viewModel/home_cubit.dart';
import '../../../../../constants.dart';
import '../../../../../core/models/transaction/transaction.dart';
import '../../../../../core/utility/app_assets.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/size_config.dart';
import 'expenses_state_item.dart';

class ExpensesStateSection extends StatelessWidget {
  const ExpensesStateSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          List<Transaction> transactions = state.transactions;
          return Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            width: SizeConfig.viewWidth,
            height: SizeConfig.viewHeight! * 0.14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kBorderColor),
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ExpensesStateItem(
                  color: kCashRedColor,
                  title: AppStrings.HOME_EXPENSES_TEXT,
                  iconSvgImage: AppAssets.CASH_ICON_PATH,
                  amount: TransactionUtils.countFullExpensesAmount(transactions),
                ),
                ExpensesStateItem(
                  color: kCashGreenColor,
                  title: AppStrings.HOME_BALANCE_TEXT,
                  iconSvgImage: AppAssets.CASH_ICON_PATH,
                  amount: TransactionUtils.countBalanceAmount(transactions),
                ),
                ExpensesStateItem(
                  color: kSecondaryColor,
                  title: AppStrings.HOME_INCOME_TEXT,
                  iconSvgImage: AppAssets.CASH_ICON_PATH,
                  amount: TransactionUtils.countFullIncomeAmount(transactions),
                ),
              ],
            ),
          );
        }
        else if (state is HomeFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
