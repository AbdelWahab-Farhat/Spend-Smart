

import 'package:dartz/dartz.dart';

import '../errors/failure.dart';
import '../models/transaction/transaction.dart';

abstract class CoreRepo {
  Future<Either<Failure, List<Transaction>>> userTransaction();
}