import 'package:spend_smart/core/models/category.dart';

class Transaction {
  final String ID;
  final double amount;
  final Category category;
  final String description;

  Transaction(
      {required this.ID,
      required this.amount,
      required this.category,
      required this.description});
}

enum TransactionEnum {
  expense,
  income
}