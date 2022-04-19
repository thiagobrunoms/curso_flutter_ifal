import 'package:curso_ifal_flutter/core/usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

class VerificationCodeParam {
  final String code;
  final String email;

  VerificationCodeParam({required this.code, required this.email});
}

abstract class VerificationCodeUsecase
    extends Usecase<Either<Failure, bool>, VerificationCodeParam> {}
