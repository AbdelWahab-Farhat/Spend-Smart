
import 'package:spend_smart/core/enums/transaction_enum.dart';
import 'package:spend_smart/core/models/transaction/transaction.dart';

import '../category/category.dart';

abstract class TransactionUtils {



  static List<Transaction> getTodayExpenses(List<Transaction> transactions) {
    DateTime now = DateTime.now();
    return transactions.where((transaction) {
      return transaction.transactionType == TransactionEnum.expense &&
          transaction.transactionDate.year == now.year &&
          transaction.transactionDate.month == now.month &&
          transaction.transactionDate.day == now.day;
    }).toList();
  }

  static List<Transaction> getYesterdayExpenses(List<Transaction> transactions) {
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day).subtract(
        const Duration(days: 1));

    return transactions.where((transaction) {
      return transaction.transactionType == TransactionEnum.expense &&
          transaction.transactionDate.year == yesterday.year &&
          transaction.transactionDate.month == yesterday.month &&
          transaction.transactionDate.day == yesterday.day;
    }).toList();
  }

  static double countDailyExpenseAmount(List<Transaction> transactions) {
    return transactions.fold(0.0, (sum, e) {
      if (e.transactionType == TransactionEnum.expense) {
        return sum + e.amount;
      }
      return sum;
    });
  }

  static countFullIncomeAmount(List<Transaction> transactions) {
   return transactions.fold(0.0, (sum, transaction) {
      if (transaction.transactionType == TransactionEnum.income) {
        return sum + transaction.amount;
      }
      return sum;
    },
   );
  }

  static countFullExpensesAmount(List<Transaction> transactions) {
    return transactions.fold(0.0, (sum, transaction) {
      if (transaction.transactionType == TransactionEnum.expense) {
        return sum + transaction.amount;
      }
      return sum;
    },
    );
  }

  static countBalanceAmount(List<Transaction> transactions) {
    double balance =  countFullIncomeAmount(transactions) - countFullExpensesAmount(transactions);
    if (balance < 0) {
      return 0;
    }
    else {
      return balance;
    }
  }


  static Map<String,List<Transaction>> expensesByCategory (List<Transaction> transactions) {
    Map<String, List<Transaction>> categoryMap = {};
    for (var transaction in transactions) {
      if (categoryMap.containsKey(transaction.category.categoryID)) {
        categoryMap[transaction.category.categoryID]!.add(transaction);
      } else {
        categoryMap[transaction.category.categoryID] = [transaction];
      }
    }
    return categoryMap;
  }


  static double countTransactionPercent (Map<String,List<Transaction>> expensesByCategory , String categoryID){
    int counter = 0;
    for (var category in expensesByCategory.entries) {
      if (category.key == categoryID) {
        counter++;
      }
    }
    return (counter / expensesByCategory.values.length) * 100;
  }
}

