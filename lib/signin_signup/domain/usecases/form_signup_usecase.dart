import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/repositories/signin_signup_repository.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/signup_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:dartz/dartz.dart';

class FormSignupUsecase implements SignUpUsecase {
  final SignInSignUpRepository repository;

  FormSignupUsecase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call({SignUpEntity? param}) async {
    var response = await repository.signUp(signUpEntity: param);

    return response.fold(
        (failure) => left(failure), (userEntity) => right(userEntity));
  }
}
