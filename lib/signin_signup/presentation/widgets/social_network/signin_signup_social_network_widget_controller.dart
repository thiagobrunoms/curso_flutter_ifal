import 'package:curso_ifal_flutter/signin_signup/data/datasources/signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/repositories/signin_signup_repository_impl.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/repositories/signin_signup_repository.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/google_signup_usecase.dart';
import 'package:mobx/mobx.dart';
part 'signin_signup_social_network_widget_controller.g.dart';

class SignInSignUpSocialNetworkWidgetController = _SignInSignUpSocialNetworkWidgetControllerBase
    with _$SignInSignUpSocialNetworkWidgetController;

abstract class _SignInSignUpSocialNetworkWidgetControllerBase with Store {
  GoogleSignupUsecase usecase;
  _SignInSignUpSocialNetworkWidgetControllerBase({required this.usecase});

  Future<void> googleSignUp() async {
    var response = await usecase();
    response.fold(
        (failure) => print(failure), (userEntity) => print(userEntity));
  }
}
