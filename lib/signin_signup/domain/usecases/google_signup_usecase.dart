import 'package:curso_ifal_flutter/signin_signup/domain/repositories/signin_signup_repository.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/signup_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';

class GoogleSignupUsecase implements SignUpUsecase {
  SignInSignUpRepository repository;

  GoogleSignupUsecase({required this.repository});

  @override
  Future<UserEntity> call({SignUpEntity? param}) async {
    return await repository.signUp();
  }
}
