import 'package:flutter/material.dart';

class SignInSingUpPage extends StatefulWidget {
  const SignInSingUpPage({Key? key}) : super(key: key);

  @override
  State<SignInSingUpPage> createState() => _SignInSingUpPageState();
}

class _SignInSingUpPageState extends State<SignInSingUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar!'),
            ),
          ],
        ),
      ),
    );
  }
}
