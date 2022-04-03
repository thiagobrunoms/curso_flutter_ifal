import 'package:curso_ifal_flutter/shared/widgets/top_bar_back_button_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/signup_controller.dart';
import 'package:curso_ifal_flutter/signin_signup/widets/basic_text_form_field_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/widets/signin_signup_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  double leftRightPaddingValue = 20.0;
  late SignUpController controller;

  @override
  void initState() {
    super.initState();

    controller = SignUpController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Observer(builder: (_) {
            // print('nameerror ${controller.nameErrorMessage}');
            // print('name ${controller.name}');
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SignInSignUpAppBarWidget(),
                  _createAccountText(),
                  BasicTextFormField(
                    label: 'Nome',
                    maxLength: 50,
                    errorText: controller.nameErrorMessage,
                    onChangedCallback: controller.setName,
                  ),
                  BasicTextFormField(
                    label: 'Email',
                    maxLength: 50,
                    inputType: TextInputType.emailAddress,
                    errorText: controller.emailErrorMessage,
                    onChangedCallback: controller.setEmail,
                  ),
                  BasicTextFormField(
                    label: 'Senha',
                    maxLength: 20,
                    inputType: TextInputType.text,
                    errorText: controller.passwordErrorMessage,
                    obscureText: controller.isVisible ? false : true,
                    icon: IconButton(
                      onPressed: () {
                        controller.changeIsVisible(!controller.isVisible);
                      },
                      icon: controller.isVisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                    onChangedCallback: controller.setPassword,
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 10, left: 13, right: 13),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: ElevatedButton(
                        onPressed: controller.isFormValid ? () {} : null,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Criar conta',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
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
