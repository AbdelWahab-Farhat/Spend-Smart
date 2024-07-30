import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:spend_smart/core/errors/failure.dart';
import 'package:spend_smart/core/models/user.dart';
import 'package:spend_smart/features/setting/data/repo/setting_repo/setting_repo.dart';

class SettingRepoImpl extends SettingRepo{
  @override
  Future<Either<Failure, User>> fetchUser() async{
    try {
      final doc = await FirebaseFirestore.instance.collection('users').doc(auth.FirebaseAuth.instance.currentUser!.uid).get();
      User user = User.fromJson(doc.data()!);
      return right(user);
    } on FirebaseException catch (e) {
      return left(ServerFailure(errMessage: e.message ?? e.code));
    }
  }

}