import 'package:cloud_firestore/cloud_firestore.dart' as store;
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spend_smart/core/errors/failure.dart';
import 'package:spend_smart/core/repo/core_repo.dart';
import '../../../core/models/transaction/transaction.dart';

class CoreRepoImpl extends CoreRepo {
  @override
  Future<Either<Failure, List<Transaction>>> userTransaction() async {
    try {
      String userID = FirebaseAuth.instance.currentUser!.uid;
      List<Transaction> transactions = [];
      final query = await store.FirebaseFirestore.instance
          .collection('transactions')
          .where('userID', isEqualTo: userID)
          .get();

      for (var doc in query.docs) {
        Transaction transaction = Transaction.fromJson(doc.data());
        transactions.add(transaction);
      }
      return right(transactions);
    } on store.FirebaseException catch (e) {
      return left(ServerFailure(errMessage: e.message ?? e.code));
    }
  }
}