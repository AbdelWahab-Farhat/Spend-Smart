import 'package:spend_smart/core/models/category/category.dart';

import '../enums/transaction_enum.dart';

class Transaction {
  final String ID;
  final double amount;
  final Category category;
  final String description;
  final DateTime transactionDate;
  final TransactionEnum transactionType;
  Transaction(
      {required this.ID,
      required this.amount,
      required this.category,
      required this.transactionDate,
      required this.description,
      required this.transactionType,
      });
}

