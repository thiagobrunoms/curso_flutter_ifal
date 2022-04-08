import 'package:curso_ifal_flutter/signin_signup/data/datasources/signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/models/user_model.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/repositories/signin_signup_repository.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';

class SignInSignUpRepositoryImpl implements SignInSignUpRepository {
  SignUpDatasource signUpDatasource;

  SignInSignUpRepositoryImpl({required this.signUpDatasource});

  @override
  Future<UserEntity> signUp({SignUpEntity? signUpEntity}) async {
    UserModel userModel = await signUpDatasource.signUp(entity: signUpEntity);

    return UserEntity(
        id: userModel.id,
        name: userModel.name,
        email: userModel.email,
        photoURL: userModel.photoURL);
  }
}
