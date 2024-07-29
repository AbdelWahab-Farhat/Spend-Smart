

import 'package:dartz/dartz.dart';
import 'package:spend_smart/core/errors/failure.dart';

import '../../../../core/models/transaction/transaction.dart';

abstract class PdfRepo {
  Future<Either<Failure,String>> generatePDF(DateTime time , Map<String, List<Transaction>> categorizedTransactions);
}