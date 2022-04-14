import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/repositories/signin_signup_repository.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/signup_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:dartz/dartz.dart';

class GoogleSignupUsecase implements SignUpUsecase {
  SignInSignUpRepository repository;

  GoogleSignupUsecase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call({SignUpEntity? param}) async {
    var response = await repository.signUp();

    return response.fold(
        (failure) => left(failure), (userEntity) => right(userEntity));
  }
}
