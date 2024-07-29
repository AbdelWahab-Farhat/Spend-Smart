

import 'package:dartz/dartz.dart';
import 'package:spend_smart/core/errors/failure.dart';
import 'package:spend_smart/core/models/transaction/transaction.dart';

abstract class TransactionRepo {
  Future<Either<Failure,void>> addNewTransaction(Transaction transaction);
}