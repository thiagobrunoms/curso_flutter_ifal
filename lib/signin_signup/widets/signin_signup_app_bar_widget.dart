import 'package:curso_ifal_flutter/shared/widgets/top_bar_back_button_widget.dart';
import 'package:flutter/material.dart';

class SignInSignUpAppBarWidget extends StatelessWidget {
  const SignInSignUpAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TopBarBackButtonWidget(
          onTabCallback: () {
            Navigator.pop(context);
          },
        ),
        Text(
          'Vamos criar uma conta?',
          style: TextStyle(fontSize: 22),
        )
      ],
    );
  }
}
