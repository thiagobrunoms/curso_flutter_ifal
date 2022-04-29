import 'package:curso_ifal_flutter/signin_signup/data/datasources/signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/repositories/signin_signup_repository_impl.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/repositories/signin_signup_repository.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/signup_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/form_signup_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/google_signup_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/signup_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  late SignUpUsecase usecase;

  _SignUpControllerBase(this.usecase);

  late SignUpEntity signUpEntity;

  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  bool isVisible = false;

  @observable
  ObservableFuture<Either<Failure, UserEntity>>? requestSignUpObsFuture;

  @observable
  String? errorMessage;

  @action
  void setName(String name) {
    this.name = name;
  }

  @action
  void setEmail(String email) {
    this.email = email;
  }

  @action
  void setPassword(String password) {
    this.password = password;
  }

  @action
  void changeIsVisible(bool isVisible) {
    this.isVisible = isVisible;
  }

  @observable
  UserEntity? userEntity;

  @computed
  bool get isValidName => name == null || (name != null && name!.length > 5);

  @computed
  bool get isValidEmail =>
      email == null ||
      (email != null && email!.length > 5 && email!.contains('@'));

  @computed
  bool get isValidPassword =>
      password == null || (password != null && password!.length >= 8);

  @computed
  String? get nameErrorMessage => !isValidName ? 'Nome inválido' : null;

  @computed
  String? get emailErrorMessage => !isValidEmail ? 'Email inválido' : null;

  @computed
  String? get passwordErrorMessage =>
      !isValidPassword ? 'Senha inválida' : null;

  @computed
  bool get isFormValid =>
      name != null &&
      email != null &&
      password != null &&
      isValidName &&
      isValidEmail &&
      isValidPassword;

  Future<void> signUp() async {
    signUpEntity =
        SignUpEntity(name: name!, email: email!, password: password!);

    requestSignUpObsFuture = ObservableFuture(usecase(param: signUpEntity));
    var response = await requestSignUpObsFuture;
    response!.fold((failure) {
      errorMessage = null;
      errorMessage = failure.errorMessage;
    }, (userEntity) => this.userEntity = userEntity);
  }
}
