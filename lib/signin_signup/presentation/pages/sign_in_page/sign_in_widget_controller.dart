import 'package:mobx/mobx.dart';
part 'sign_in_widget_controller.g.dart';

class SignInWidgetController = _SignInWidgetControllerBase
    with _$SignInWidgetController;

abstract class _SignInWidgetControllerBase with Store {
  @observable
  String? email;

  @observable
  String? password;

  @observable
  bool isVisible = false;

  void setEmail(String email) => this.email = email;

  void setPassword(String password) => this.password = password;

  void setIsVisible() => isVisible = !isVisible;

  @computed
  bool get isValidEmail =>
      email == null ||
      (email != null && email!.length > 5 && email!.contains('@'));

  @computed
  bool get isValidPassword =>
      password == null || (password != null && password!.length >= 8);

  @computed
  String? get emailErrorMessage => !isValidEmail ? "Email inválido" : null;

  @computed
  String? get passwordErrorMessage =>
      !isValidPassword ? "Senha inválida" : null;

  @computed
  bool get isFormValid =>
      email != null && isValidEmail && password != null && isValidPassword;
}
