import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';

abstract class SignInSignUpRepository {
  Future<UserEntity> signUp({SignUpEntity? signUpEntity});
}
