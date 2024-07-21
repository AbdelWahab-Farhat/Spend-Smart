

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spend_smart/core/errors/failure.dart';
import 'package:spend_smart/features/Login/data/repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<Either<Failure, void>> userAuth() async {
    try {
      await GoogleSignIn().signIn();
      return right(null);
    }on FirebaseAuthException catch  (error) {
      return left(ServerFailure(errMessage: error.message ?? error.code));
    }
  }

}