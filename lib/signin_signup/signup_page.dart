import 'package:curso_ifal_flutter/shared/widgets/top_bar_back_button_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/widets/signin_signup_app_bar_widget.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Column(
              children: [
                const SignInSignUpAppBarWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
