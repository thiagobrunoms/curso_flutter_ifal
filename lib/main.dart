import 'package:curso_ifal_flutter/app_module.dart';
import 'package:curso_ifal_flutter/get-started/onboarding-screen-page.dart';
import 'package:curso_ifal_flutter/layout/colors.dart';
import 'package:curso_ifal_flutter/main/main_page.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/get_started/signin_signup_get_started_page.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/sign_in_page/sign_in_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/sign_up_page/signup_page.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/verification_code_page/form_based_verification_code_page.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/routes.dart';

import 'package:curso_ifal_flutter/state_management_tests/streams_page.dart';
import 'package:curso_ifal_flutter/state_management_tests/streams_page_mobx.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: MyApp()));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Dentistas',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[100],
          fontFamily: 'Euclid',
          primarySwatch: mainMaterialColor,
          primaryColor: mainMaterialColor),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      // routes: {
      //   "/": (BuildContext context) => OnBoardingPage(),
      //   toSignUpPage: (BuildContext context) => SignUpWidget(),
      //   toSigninPage: (BuildContext context) => SignInWidget(),
      //   toMainPage: (BuildContext context) => MainPage(),
      //   toGetStarted: (BuildContext context) => SignInSignUpGetStartedPage(),
      //   toVerificationCode: (BuildContext context) =>
      //       FormBasedVerificationCodePage()
      // },
    );
  }
}
