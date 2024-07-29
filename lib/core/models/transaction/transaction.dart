import 'package:spend_smart/core/models/category/category.dart';
import '../../enums/transaction_enum.dart';

class Transaction {
  final String ID;
  final String userID;
  final double amount;
  final Category category;
  final String description;
  final DateTime transactionDate;
  final TransactionEnum transactionType;

  Transaction( {
    required this.ID,
    required this.userID,
    required this.amount,
    required this.category,
    required this.transactionDate,
    required this.description,
    required this.transactionType,
  });

  // fromJson method
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      ID: json['ID'],
      userID: json['userID'],
      amount: json['amount'],
      category: Category.fromJson(json['category']),
      transactionDate: DateTime.parse(json['transactionDate']),
      description: json['description'],
      transactionType: TransactionEnum.values.firstWhere((value) {
        return value.toString() == 'TransactionEnum.${json['transactionType']
        }';
      }),
    );
  }
  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'ID': ID,
      'userID': userID,
      'amount': amount,
      'category': category.toJson(),
      'transactionDate': transactionDate.toIso8601String(),
      'description': description,
      'transactionType': transactionType.name,
    };
  }
}
