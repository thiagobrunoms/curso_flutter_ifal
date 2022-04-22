import 'package:curso_ifal_flutter/core/value_object.dart';

class SignInEntity {
  final Email email;
  final Password password;

  SignInEntity({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }

  @override
  String toString() => '[email: $email, password: $password]';
}
