import 'package:curso_ifal_flutter/get-started/onboarding-screen-page.dart';
import 'package:curso_ifal_flutter/infra_module.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/routes.dart';
import 'package:curso_ifal_flutter/signin_signup/sign_in_sign_up_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [
        InfraModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => OnBoardingPage()),
        ModuleRoute('/$toGetStarted', module: SignInSignUpModule()),
      ];
}
