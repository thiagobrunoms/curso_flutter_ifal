import 'package:curso_ifal_flutter/core/value_object.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/errors.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/value_failures.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/repositories/signin_signup_repository.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signin_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/sign_in_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';

class FormBasedSignInUsecase implements SignInUsecase {
  SignInSignUpRepository repository;

  FormBasedSignInUsecase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(
      {UserSignInCredentialParam? param}) async {
    if (param != null) {
      Email email = Email.fromString(param.email);

      if (!email.isValid()) {
        EmailFailure? emailFailure =
            email.value.fold((emailFailure) => emailFailure, (r) => null);

        return left(emailFailure!);
      }

      Password password = Password.fromString(param.password);

      if (!password.isValid()) {
        PasswordFailure? passwordFailure = password.value
            .fold((passwordFailure) => passwordFailure, (r) => null);

        return left(passwordFailure!);
      }

      return repository.signIn(
          signInEntity: SignInEntity(email: email, password: password));
    }

    throw UnexpectedError(errorMessage: 'Parâmetro inválido');
  }
}
