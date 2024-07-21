

import 'package:dartz/dartz.dart';
import 'package:spend_smart/core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure,void>> userAuth();
}