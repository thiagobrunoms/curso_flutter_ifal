import 'package:curso_ifal_flutter/signin_signup/presentation/pages/signin_signup_base_page.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/basic_text_form_field_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/default_button_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/signin_signup_app_bar_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/signin_signup_title_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/social_network/signin_signup_social_network_widget.dart';
import 'package:flutter/material.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  @override
  Widget build(BuildContext context) {
    double formWidth = MediaQuery.of(context).size.width;

    return SignInSignUpBasePage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignInSignUpAppBarWidget(),
          const SignInSignUpTitleWidget(titleList: ['Fazer', 'Login']),
          BasicTextFormField(
            width: formWidth,
            label: 'Email',
            maxLength: 50,
            inputType: TextInputType.emailAddress,
            // errorText: controller.emailErrorMessage,
            // onChangedCallback: controller.setEmail,
          ),
          BasicTextFormField(
            width: formWidth,
            label: 'Senha',
            maxLength: 20,
            inputType: TextInputType.text,
            // errorText: controller.passwordErrorMessage,
            // obscureText: controller.isVisible ? false : true,
            // icon: IconButton(
            //   onPressed: () {
            //     controller.changeIsVisible(!controller.isVisible);
            //   },
            //   icon: controller.isVisible
            //       ? Icon(Icons.visibility)
            //       : Icon(Icons.visibility_off),
            // ),
            // onChangedCallback: controller.setPassword,
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: formWidth,
            height: MediaQuery.of(context).size.height * 0.08,
            child: DefaultButton(
              color: Theme.of(context).primaryColor,
              widget: const Text(
                "Fazer Login",
                style: TextStyle(color: Colors.white),
              ),
              callback: () {},
            ),
          ),
          const SizedBox(height: 30),
          SignInSignUpSocialNetworkWidget(),
        ],
      ),
    );
  }
}