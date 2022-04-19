import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/repositories/code_verification_repository.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/verification_code_usecase.dart';
import 'package:dartz/dartz.dart';

class FormBasedVerificationCodeUsecase implements VerificationCodeUsecase {
  final VerificationCodeRepository? repository;

  FormBasedVerificationCodeUsecase({this.repository});

  @override
  Future<Either<Failure, bool>> call({VerificationCodeParam? param}) async {
    if (param?.code.length != 4) {
      return left(InvalidVerificationCodeFailure(
          errorMessage: 'Código de verificação não permitido!'));
    }

    return await repository?.verifyCode(param: param);
  }
}
