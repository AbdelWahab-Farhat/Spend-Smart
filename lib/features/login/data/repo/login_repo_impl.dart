

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spend_smart/core/errors/failure.dart';
import 'package:spend_smart/features/Login/data/repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {

  @override
  Future<Either<Failure,void>> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        User? user = userCredential.user;
        if (user != null) {
          await saveUserToFiresstore(user);
        }
        return right(null);
      }
      return left(ServerFailure(errMessage: 'user-cancel-sign-up'));
    } on FirebaseException catch (e) {
      return left(ServerFailure(errMessage:e.message ?? e.code));
    }
  }
}
// add new User To Firebase if first time login
// TODO:ADD CHECK ERRORS LATER (IF THERE IS AN ERROR IN SAVING USER)
Future<void> saveUserToFiresstore(User user) async {
  final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
  // Check if the user document already exists
  final doc = await userRef.get();

  if (!doc.exists) {
    // Create a new user document
    await userRef.set({
      'uid': user.uid,
      'email': user.email,
      'displayName': user.displayName,
      'lastSignInTime': user.metadata.lastSignInTime,
      'creationTime': user.metadata.creationTime,
    });
  } else {
    // Update the last sign-in time
    await userRef.update({
      'lastSignInTime': user.metadata.lastSignInTime,
    });
  }
}