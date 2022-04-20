import 'package:flutter/material.dart';

class SignInSignUpBasePage extends StatelessWidget {
  final Widget child;
  const SignInSignUpBasePage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 5.0,
              left: 17.0,
              right: 17.0,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
