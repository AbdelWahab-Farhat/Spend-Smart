import 'transaction.dart';

class User {
  final DateTime creationTime;
  final String displayName;
  final String email;
  final String uid;
  // Each User Will Have no Transaction (income && expenses) at first
  final List<Transaction>? transactions;
  User(
      {required this.creationTime,
      required this.displayName,
      required this.uid,
      required this.email,
      required this.transactions
      });
}
