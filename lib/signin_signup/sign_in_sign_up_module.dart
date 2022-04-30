import 'package:curso_ifal_flutter/infra_module.dart';
import 'package:curso_ifal_flutter/signin_signup/data/datasources/rest_signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/repositories/signin_signup_repository_impl.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/form_based_sign_in_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/form_based_verification_code_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/form_signup_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/get_started/signin_signup_get_started_page.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/sign_in_page/sign_in_widget_controller.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/sign_up_page/signup_controller.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/sign_up_page/signup_page.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignInSignUpModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => RestSignUpDatasource(dio: i.get())),
        Bind.singleton(
            (i) => SignInSignUpRepositoryImpl(signUpDatasource: i.get())),
        Bind.singleton((i) => FormSignupUsecase(repository: i.get())),
        Bind.singleton((i) => SignUpController(usecase: i.get())),
        Bind.singleton(
            (i) => FormBasedVerificationCodeUsecase(repository: i.get())),
        Bind.singleton((i) => FormBasedSignInUsecase(repository: i.get())),
        Bind.singleton((i) => SignInWidgetController(usecase: i.get())),
      ];

  @override
  List<Module> get imports => [
        InfraModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const SignInSignUpGetStartedPage()),
        ChildRoute(toSignUpPage,
            child: (context, args) => const SignUpWidget()),
      ];
}
