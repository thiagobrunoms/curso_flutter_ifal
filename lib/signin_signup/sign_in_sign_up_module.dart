import 'package:curso_ifal_flutter/app_module.dart';
import 'package:curso_ifal_flutter/main/main_module.dart';
import 'package:curso_ifal_flutter/signin_signup/data/datasources/rest_signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/repositories/signin_signup_repository_impl.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/form_based_sign_in_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/form_based_verification_code_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/form_signup_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/google_signup_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/verification_code_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/get_started/signin_signup_get_started_page.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/sign_in_page/sign_in_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/sign_in_page/sign_in_widget_controller.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/sign_up_page/signup_controller.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/sign_up_page/signup_page.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/verification_code_page/form_based_verification_code_page.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/verification_code_page/form_based_verification_code_page_controller.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/routes.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/social_network/signin_signup_social_network_widget_controller.dart';
import 'package:curso_ifal_flutter/tentativas/sigin_signup/verification_code_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignInSignUpModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => RestSignUpDatasource(i.get())),
        Bind.singleton((i) => SignInSignUpRepositoryImpl(
            signUpDatasource: i.get(),
            signInDatasource: i.get(),
            verificationCodeDatasource: i.get())),
        Bind.singleton((i) => FormBasedSignInUsecase(repository: i.get())),
        Bind.singleton((i) => FormSignupUsecase(repository: i.get())),
        Bind.singleton(
            (i) => FormBasedVerificationCodeUsecase(repository: i.get())),
        Bind.singleton(
            (i) => FormBasedVerificationCodePageController(usecase: i.get())),
        Bind.singleton((i) => GoogleSignupUsecase(repository: i.get())),
        Bind.singleton(
            (i) => SignInSignUpSocialNetworkWidgetController(usecase: i.get())),
        Bind.singleton((i) => SignInWidgetController(usecase: i.get())),
        Bind.singleton((i) => SignUpController(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const SignInSignUpGetStartedPage()),
        ChildRoute('/$toSignUpPage',
            child: (context, args) => const SignUpWidget()),
        ChildRoute(
          '/$toSigninPage',
          child: (context, args) => const SignInWidget(),
        ),
        ChildRoute('/$toVerificationCode',
            child: (context, args) => FormBasedVerificationCodePage(
                  userEntity: args.data,
                )),
        ModuleRoute('/$toMainPage', module: MainModule())
      ];
}
