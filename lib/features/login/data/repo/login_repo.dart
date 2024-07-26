

import 'package:dartz/dartz.dart';
import 'package:spend_smart/core/errors/failure.dart';

abstract class LoginRepo {
  // FirebaseAuth User
  Future<Either<Failure,void>> signInWithGoogle();
}