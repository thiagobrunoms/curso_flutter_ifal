import 'package:curso_ifal_flutter/shared/widgets/top_bar_back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignInSignUpAppBarWidget extends StatelessWidget {
  const SignInSignUpAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TopBarBackButtonWidget(
          onTabCallback: () {
            Modular.to.pop();
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
