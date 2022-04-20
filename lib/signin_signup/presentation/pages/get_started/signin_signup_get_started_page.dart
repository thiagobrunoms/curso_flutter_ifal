import 'package:curso_ifal_flutter/signin_signup/presentation/pages/sign_up_page/signup_page.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/routes.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/default_button_widget.dart';
import 'package:flutter/material.dart';

class SignInSignUpGetStartedPage extends StatelessWidget {
  const SignInSignUpGetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/fluorine-app-logo.png",
                scale: 2,
              ),
              Image.asset(
                "assets/images/onboarding - dentists-front.png",
                scale: 2,
              ),
              Column(
                children: [
                  const Text("Escolha uma das opções grátis"),
                  SizedBox(height: 15),
                  SizedBox(
                    width: width * 0.95,
                    height: height * 0.07,
                    child: DefaultButton(
                      color: Theme.of(context).primaryColor,
                      widget: const Text("Criar Conta",
                          style: TextStyle(color: Colors.white)),
                      callback: () {
                        Navigator.pushNamed(context, toSignUpPage);
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: width * 0.95,
                    height: height * 0.07,
                    child: DefaultButton(
                      color: Colors.white,
                      widget: Text("Fazer Login",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      callback: () {
                        print("Ir para tela de login");
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
