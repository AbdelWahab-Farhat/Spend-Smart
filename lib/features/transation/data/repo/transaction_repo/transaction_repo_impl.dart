

import 'package:cloud_firestore/cloud_firestore.dart' as store;
import 'package:dartz/dartz.dart';
import 'package:spend_smart/core/errors/failure.dart';
import 'package:spend_smart/features/transation/data/repo/transaction_repo/transaction_repo.dart';

import '../../../../../core/models/transaction/transaction.dart';

class TransactionRepoImpl extends TransactionRepo{
  @override
  Future<Either<Failure, void> > addNewTransaction(Transaction transaction) async {
    try {
      await store.FirebaseFirestore.instance.collection('transactions').doc(transaction.ID).set(transaction.toJson());
      return right(null);
    } on store.FirebaseException catch (e) {
      return left(ServerFailure(errMessage: e.message ?? e.code));
    }
  }
  
}