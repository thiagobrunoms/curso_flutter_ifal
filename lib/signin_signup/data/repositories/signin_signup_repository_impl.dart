import 'package:curso_ifal_flutter/signin_signup/data/datasources/signin_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/datasources/signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/datasources/verification_code_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/repositories/code_verification_repository.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/repositories/signin_signup_repository.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signin_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/verification_code_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:dartz/dartz.dart';

class SignInSignUpRepositoryImpl
    implements
        SignInSignUpRepository,
        VerificationCodeRepository<Either<Failure, bool>,
            VerificationCodeParam> {
  SignUpDatasource signUpDatasource;
  SignInDatasource? signInDatasource;
  VerificationCodeDatasource? verificationCodeDatasource;

  SignInSignUpRepositoryImpl(
      {required this.signUpDatasource,
      this.verificationCodeDatasource,
      this.signInDatasource});

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

  @override
  Future<Either<Failure, bool>> verifyCode(
      {required VerificationCodeParam param}) async {
    return await verificationCodeDatasource?.verifyCode(param: param);
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(
      {required SignInEntity signInEntity}) async {
    var response = await signInDatasource?.signIn(entity: signInEntity);

    return response!.fold(
        (failure) => left(failure),
        (userEntity) => right(UserEntity(
            id: userEntity.id,
            name: userEntity.name,
            email: userEntity.email,
            photoURL: userEntity.photoURL)));
  }
}
