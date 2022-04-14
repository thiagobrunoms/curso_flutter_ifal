import 'package:curso_ifal_flutter/signin_signup/data/models/user_model.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpDatasource {
  Future<Either<Failure, UserModel>> signUp({SignUpEntity? entity});
}
