import 'package:curso_ifal_flutter/signin_signup/domain/data/models/user_model.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';

abstract class SignUpDatasource {
  Future<UserModel> signUp({SignUpEntity? entity});
}
