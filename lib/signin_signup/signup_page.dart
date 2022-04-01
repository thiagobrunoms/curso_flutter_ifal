import 'package:curso_ifal_flutter/shared/widgets/top_bar_back_button_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/widets/signin_signup_app_bar_widget.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  double leftRightPaddingValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SignInSignUpAppBarWidget(),
                _createAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createAccountText() {
    return Padding(
      padding: EdgeInsets.only(
          top: 45,
          bottom: 15,
          left: leftRightPaddingValue,
          right: leftRightPaddingValue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getText('Criar'),
          _getText('Conta'),
        ],
      ),
    );
  }

  Widget _getText(String content) => Text(
        content,
        style: const TextStyle(fontSize: 45),
      );
}
