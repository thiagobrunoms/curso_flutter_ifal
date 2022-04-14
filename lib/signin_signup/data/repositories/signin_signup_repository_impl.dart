import 'package:curso_ifal_flutter/signin_signup/data/datasources/signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/models/user_model.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/repositories/signin_signup_repository.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:dartz/dartz.dart';

class SignInSignUpRepositoryImpl implements SignInSignUpRepository {
  SignUpDatasource signUpDatasource;

  SignInSignUpRepositoryImpl({required this.signUpDatasource});

  @override
  Future<Either<Failure, UserEntity>> signUp(
      {SignUpEntity? signUpEntity}) async {
    var response = await signUpDatasource.signUp(entity: signUpEntity);

    return response.fold(
        (failure) => left(failure),
        (userEntity) => right(UserEntity(
            id: userEntity.id,
            name: userEntity.name,
            email: userEntity.email,
            photoURL: userEntity.photoURL)));
  }
}
