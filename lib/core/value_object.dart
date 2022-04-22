import 'package:curso_ifal_flutter/signin_signup/domain/failures/errors.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/value_failures.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class ValueObject<T> extends Equatable {
  Either<ValueFailure, T> get value;

  bool isValid() => value.isRight();

  T getOrCrash() {
    return value.fold(
        (l) => throw UnexpectedError(errorMessage: 'Valor inconsistente!'),
        (r) => r);
  }

  @override
  List<Object> get props => [value];
}

class Email extends ValueObject<String> {
  @override
  Either<EmailFailure, String> value;

  Email._(this.value);

  factory Email.fromString(String email) {
    return Email._(validateEmail(email));
  }
}

class Password extends ValueObject<String> {
  @override
  Either<PasswordFailure, String> value;

  Password._(this.value);

  factory Password.fromString(String password) {
    return Password._(validatePassword(password));
  }
}
