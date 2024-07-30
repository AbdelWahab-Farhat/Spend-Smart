import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spend_smart/core/models/transaction/transaction_utils.dart';
import 'package:spend_smart/core/widgets/custom_error_widget.dart';
import 'package:spend_smart/core/widgets/custom_loading_widget.dart';
import 'package:spend_smart/features/search/presentation/viewModel/category_filter_cubit/category_filter_cubit.dart';
import 'package:spend_smart/features/search/presentation/viewModel/search_cubit/search_cubit.dart';
import '../../../../../constants.dart';
import '../../../../../core/utility/app_strings.dart';
import '../../../../../core/utility/app_style.dart';
import '../../../../../core/widgets/custom_expense_item_widget.dart';

class ResultSection extends StatelessWidget {

  const ResultSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        if (state is SearchSuccess) {
          var getSearchCubit = context.read<SearchCubit>();
          var getCategoryFilterCubit = context.read<CategoryFilterCubit>();
          var filteredList = getSearchCubit.transactionsByFilter(getCategoryFilterCubit.filterCategories);
          var filteredByName = getSearchCubit.searchTransactionsByName(filteredList);
          var map = TransactionUtils.expensesByDate(filteredByName);
          
          return Column(
            children: [
              ...map.entries.map((entry) {
                return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                border: Border.all(color: kBorderColor),
                borderRadius: BorderRadius.circular(8)
                ),
                child :Column(
                  children: [
                    dayAndFullExpenseRow(entry.key,TransactionUtils.countDayExpenseAmount(entry.value)),
                    const SizedBox(height: 8,),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: entry.value.length,
                      itemBuilder: (context, index) =>
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: CustomExpenseItemWidget(transaction: entry.value[index],),
                          ),
                    ),
                  ],
                  ),
                );
              },)
            ],);
        }
        return const CustomLoadingWidget();
      },
    );
  }


  Row dayAndFullExpenseRow(DateTime date, double expenseAmount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${date.year}-${date.month}-${date.day}", style: AppStyle.body2,),
        Text('- ${AppStrings.currency} ${expenseAmount.toStringAsFixed(0)}')
      ],);
  }
}

