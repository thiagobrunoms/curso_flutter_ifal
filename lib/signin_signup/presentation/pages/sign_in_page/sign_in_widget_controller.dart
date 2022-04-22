import 'package:curso_ifal_flutter/signin_signup/data/datasources/signin_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/repositories/signin_signup_repository_impl.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/value_validators.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/repositories/signin_signup_repository.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/form_based_sign_in_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/sign_in_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
part 'sign_in_widget_controller.g.dart';

class SignInWidgetController = _SignInWidgetControllerBase
    with _$SignInWidgetController;

abstract class _SignInWidgetControllerBase with Store {
  late SignInSignUpRepository repository;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  bool isVisible = false;

  @observable
  ObservableFuture<Either<Failure, UserEntity>>? signInObsFut;

  @observable
  String? signInErrorMessage;

  @observable
  bool? signInSuccess;

  @observable
  UserEntity? userEntity;

  void setEmail(String email) => this.email = email;

  void setPassword(String password) => this.password = password;

  void setIsVisible() => isVisible = !isVisible;

  @computed
  bool get isValidEmail => email == null || validateEmail(email!).isRight();

  @computed
  bool get isValidPassword =>
      password == null || validatePassword(password!).isRight();

  @computed
  String? get emailErrorMessage => email == null
      ? null
      : validateEmail(email!).fold((l) => l.errorMessage, (r) => null);

  @computed
  String? get passwordErrorMessage => password == null
      ? null
      : validatePassword(password!).fold((l) => l.errorMessage, (r) => null);

  @computed
  bool get isFormValid =>
      email != null && isValidEmail && password != null && isValidPassword;

  void setDataSource(SignInDatasource signInDatasource) {
    repository = SignInSignUpRepositoryImpl(signInDatasource: signInDatasource);
  }

  Future<void> signIn() async {
    UserSignInCredentialParam param =
        UserSignInCredentialParam(email: email!, password: password!);

    SignInUsecase usecase = FormBasedSignInUsecase(repository: repository);
    signInObsFut = ObservableFuture(usecase(param: param));

    var response = await signInObsFut;
    response?.fold((failure) {
      signInErrorMessage = null;
      signInErrorMessage = failure.errorMessage;
    }, (userEntity) => this.userEntity = userEntity);
  }
}
