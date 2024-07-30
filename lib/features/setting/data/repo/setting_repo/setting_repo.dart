


import 'package:dartz/dartz.dart';
import 'package:spend_smart/core/errors/failure.dart';
import 'package:spend_smart/core/models/user.dart';

abstract class SettingRepo {
  Future<Either<Failure,User>> fetchUser();
}