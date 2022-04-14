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
