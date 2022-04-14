import 'package:curso_ifal_flutter/core/usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpUsecase
    extends Usecase<Either<Failure, UserEntity>, SignUpEntity> {}
