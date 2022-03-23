import 'package:curso_ifal_flutter/application/pages/main_page.dart';
import 'package:curso_ifal_flutter/tentativas/get_started/presentation/get_started_page.dart';
import 'package:curso_ifal_flutter/tentativas/shared/layout/colors.dart';
import 'package:curso_ifal_flutter/tentativas/sigin_signup/presentation/signinup_main_page.dart';
import 'package:curso_ifal_flutter/tentativas/sigin_signup/presentation/signup_page.dart';
import 'package:curso_ifal_flutter/tentativas/sigin_signup/presentation/widgets/signin_signup_app_bar_widget.dart';
import 'package:curso_ifal_flutter/tentativas/widgets/main_page/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dentistas',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[100],
          fontFamily: 'Euclid',
          primarySwatch: mainMaterialColor,
          primaryColor: mainMaterialColor),
      home:
          GetStartedPage(), //const SignInUpMainPage(), //const SignInUpMainPage() //const GetStartedPage() //const MainScreen(),
      routes: {
        '/toSignUpPage': (BuildContext context) => SignUpPage(),
      },
    );
  }
}
