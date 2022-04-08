import 'package:curso_ifal_flutter/signin_signup/domain/data/datasources/signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/data/models/user_model.dart';

class RestSignUpDatasource implements SignUpDatasource {
  @override
  Future<UserModel> signUp({SignUpEntity? entity}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
