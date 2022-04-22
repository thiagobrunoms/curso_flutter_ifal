import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';

abstract class ValueFailure extends Failure {
  String errorMessage;

  ValueFailure({required this.errorMessage})
      : super(errorMessage: errorMessage);

  @override
  String toString() => 'errorMessage: $errorMessage';
}

class EmailFailure extends ValueFailure {
  EmailFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class PasswordFailure extends ValueFailure {
  PasswordFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
