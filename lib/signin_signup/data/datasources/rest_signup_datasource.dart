import 'dart:convert';
import 'package:curso_ifal_flutter/signin_signup/data/datasources/signin_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/datasources/signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/datasources/verification_code_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/models/user_model.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signin_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/verification_code_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RestSignUpDatasource
    implements
        SignUpDatasource,
        SignInDatasource,
        VerificationCodeDatasource<Either<Failure, bool>,
            VerificationCodeParam> {
  // final String baseUrl = "http://10.0.2.2:3000";
  Dio dio;
  RestSignUpDatasource(this.dio);

  @override
  Future<Either<Failure, UserModel>> signUp({SignUpEntity? entity}) async {
    try {
      var response = await dio.post(
        '/signup',
        data: json.encode(
          entity?.toMap(),
        ),
      );

      return right(UserModel.fromMap(response.data));
    } on DioError catch (e) {
      return left(UserAlreadyExistsFailure(
          errorMessage: 'Usuário com email ${entity!.email} já existente!'));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyCode(
      {required VerificationCodeParam param}) async {
    try {
      var response = await dio.post('/signup/verification',
          data: json.encode({'code': param.code, 'email': param.email}));

      print(response.data);

      return right(true);
    } on DioError catch (e) {
      print(e);
      return left(
          VerificationCodeNotMatch(errorMessage: e.response?.data['message']));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signIn(
      {required SignInEntity entity}) async {
    try {
      String? email = entity.email.value.fold((l) => null, (r) => r);
      String? password = entity.password.value.fold((l) => null, (r) => r);

      var response = await dio.post(
        '/signin',
        data: json.encode(
          {'email': email, 'password': password},
        ),
      );

      return right(UserModel.fromMap(response.data));
    } on DioError catch (e) {
      return left(
          UserCredentialsNotMatch(errorMessage: e.response?.data['message']));
    }
  }
}
