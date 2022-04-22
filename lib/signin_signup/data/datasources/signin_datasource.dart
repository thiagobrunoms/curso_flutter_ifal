import 'package:curso_ifal_flutter/signin_signup/data/models/user_model.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signin_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignInDatasource {
  Future<Either<Failure, UserModel>> signIn({required SignInEntity entity});
}
