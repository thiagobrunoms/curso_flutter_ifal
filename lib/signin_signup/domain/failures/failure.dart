import 'package:dartz/dartz.dart';

abstract class Failure {
  String errorMessage;

  Failure({required this.errorMessage});

  @override
  String toString() => 'errorMessage: $errorMessage';
}

class UserAlreadyExistsFailure extends Failure {
  UserAlreadyExistsFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class InvalidVerificationCodeFailure extends Failure {
  InvalidVerificationCodeFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class VerificationCodeNotMatch extends Failure {
  VerificationCodeNotMatch({required String errorMessage})
      : super(errorMessage: errorMessage);
}

class UserCredentialsNotMatch extends Failure {
  UserCredentialsNotMatch({required String errorMessage})
      : super(errorMessage: errorMessage);
}
