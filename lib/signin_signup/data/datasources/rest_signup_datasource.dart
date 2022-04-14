import 'dart:convert';
import 'package:curso_ifal_flutter/signin_signup/data/datasources/signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/models/user_model.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RestSignUpDatasource implements SignUpDatasource {
  Dio dio;

  RestSignUpDatasource(this.dio);

  @override
  Future<Either<Failure, UserModel>> signUp({SignUpEntity? entity}) async {
    try {
      var response = await dio.post(
        'http://10.0.2.2:3000/signup',
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
}
