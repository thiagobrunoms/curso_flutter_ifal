import 'dart:convert';
import 'package:curso_ifal_flutter/signin_signup/data/datasources/signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/models/user_model.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:dio/dio.dart';

class RestSignUpDatasource implements SignUpDatasource {
  Dio dio;

  RestSignUpDatasource(this.dio);

  @override
  Future<UserModel> signUp({SignUpEntity? entity}) async {
    try {
      var response = await dio.post(
        'http://192.168.0.107:3000/signup',
        data: json.encode(
          entity?.toMap(),
        ),
      );

      return UserModel.fromMap(response.data);
    } on DioError catch (e) {
      rethrow;
    }
  }
}
