import 'package:curso_ifal_flutter/signin_signup/data/datasources/rest_signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/sign_in_page/sign_in_widget_controller.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/signin_signup_base_page.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/routes.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/basic_text_form_field_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/default_button_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/signin_signup_app_bar_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/signin_signup_title_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/social_network/signin_signup_social_network_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  SignInWidgetController? controller;
  late ReactionDisposer singInErrorMessageDisposer;
  late ReactionDisposer singInSuccessDisposer;

  @override
  void initState() {
    super.initState();

    controller = SignInWidgetController();
    controller?.setDataSource(RestSignUpDatasource(Dio()));
    singInErrorMessageDisposer = reaction(
        (_) => controller?.signInErrorMessage, handleSignInErrorMessage);

    singInSuccessDisposer =
        reaction((_) => controller?.userEntity, handleSignInSuccess);
  }

  @override
  void dispose() {
    singInErrorMessageDisposer();
    super.dispose();
  }

  void handleSignInErrorMessage(String? message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message!)));
  }

  void handleSignInSuccess(UserEntity? userEntity) {
    Navigator.pushNamed(context, toMainPage, arguments: userEntity);
  }

  @override
  Widget build(BuildContext context) {
    double formWidth = MediaQuery.of(context).size.width;

    return SignInSignUpBasePage(
      child: Observer(builder: (_) {
        return Column(
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
              errorText: controller!.emailErrorMessage,
              onChangedCallback: controller?.setEmail,
            ),
            BasicTextFormField(
              width: formWidth,
              label: 'Senha',
              maxLength: 20,
              inputType: TextInputType.text,
              errorText: controller!.passwordErrorMessage,
              obscureText: controller!.isVisible ? false : true,
              icon: IconButton(
                onPressed: () {
                  controller?.setIsVisible();
                },
                icon: controller!.isVisible
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
              onChangedCallback: controller?.setPassword,
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
                callback: controller!.isFormValid
                    ? () {
                        print('Enviar dados!');
                        controller?.signIn();
                      }
                    : null,
              ),
            ),
            const SizedBox(height: 30),
            SignInSignUpSocialNetworkWidget(),
          ],
        );
      }),
    );
  }
}
