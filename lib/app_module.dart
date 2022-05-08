import 'package:curso_ifal_flutter/get_started/onboarding_screen_page.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/routes.dart';
import 'package:curso_ifal_flutter/signin_signup/sign_in_sign_up_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'infra_module.dart';

class AppModule extends Module {

  @override
  List<ModularRoute> get routes => [
        // ModuleRoute('/$toGetStartedPage', module: GetStartedModule()),
        ChildRoute('/', child: (context, args) => OnBoardingPage()),
        ModuleRoute('/$toGetStarted', module: SignInSignUpModule()),
      ];
}
