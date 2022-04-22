import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signin_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignInSignUpRepository {
  Future<Either<Failure, UserEntity>> signUp({SignUpEntity? signUpEntity});
  Future<Either<Failure, UserEntity>> signIn(
      {required SignInEntity signInEntity});
}
