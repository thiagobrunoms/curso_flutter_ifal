import 'package:curso_ifal_flutter/core/usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';

abstract class SignUpUsecase extends Usecase<UserEntity, SignUpEntity> {}
