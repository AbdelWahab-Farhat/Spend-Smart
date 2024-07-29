import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spend_smart/core/enums/transaction_enum.dart';

import '../../../../../core/models/transaction/transaction.dart';
import '../../../../../core/repo/core_repo.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  final CoreRepo coreRepo;
  ReportCubit(this.coreRepo) : super(ReportInitial());

  Future<void> initTransactions(int year  , int month) async {
    emit(ReportLoading());
    var result = await coreRepo.userTransaction();
    result.fold(
      (failure) => emit(ReportFailure(errMessage: failure.errMessage)),
      (userTransactions) {

        emit(ReportSuccess(transactions: getExpensesByDate(transactions: userTransactions, year: year, month: month)));
      },
    );
  }

  List<Transaction> getExpensesByDate({
    required List<Transaction> transactions,
    required int year,
    required int month,
  }) {
    return transactions.where((transaction) {
      return transaction.transactionType  == TransactionEnum.expense && transaction.transactionDate.year == year && transaction.transactionDate.month == month;
    }).toList();
  }

}
