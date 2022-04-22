import 'package:curso_ifal_flutter/core/usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:dartz/dartz.dart';

class UserSignInCredentialParam {
  final String email;
  final String password;

  UserSignInCredentialParam({required this.email, required this.password});
}

abstract class SignInUsecase
    extends Usecase<Either<Failure, UserEntity>, UserSignInCredentialParam> {}
