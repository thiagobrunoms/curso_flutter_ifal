import 'package:curso_ifal_flutter/signin_signup/data/datasources/google_signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/datasources/rest_signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/sign_up_page/signup_controller.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/signin_signup_base_page.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/routes.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/basic_text_form_field_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/default_button_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/signin_signup_app_bar_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/signin_signup_title_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/social_network/signin_signup_social_network_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/sign_in_sign_up_module.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  double formWidth = 0;
  late ReactionDisposer errorDisposer;
  late ReactionDisposer successDisposer;
  double leftRightPaddingValue = 20.0;
  late SignUpController controller;

  @override
  void initState() {
    super.initState();

    controller = Modular.get<SignUpController>();
    errorDisposer =
        reaction((_) => controller.errorMessage, signUpErrorHandler);
    errorDisposer = successDisposer =
        reaction((_) => controller.userEntity, signUpSuccessHandler);
  }

  @override
  void didChangeDependencies() {
    formWidth = MediaQuery.of(context).size.width;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    errorDisposer();
    super.dispose();
  }

  void signUpErrorHandler(String? message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message!),
    ));
  }

  void signUpSuccessHandler(UserEntity? userEntity) {
    // Navigator.pushNamed(context, toVerificationCode, arguments: userEntity);
    print('userEntity $userEntity');
    Modular.to.pushNamed(toVerificationCode, arguments: userEntity);
  }

  @override
  Widget build(BuildContext context) {
    return SignInSignUpBasePage(
      child: Observer(builder: (_) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.95,
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignInSignUpAppBarWidget(),
              const SignInSignUpTitleWidget(titleList: ['Criar', 'Conta']),
              BasicTextFormField(
                width: formWidth,
                label: 'Nome',
                maxLength: 50,
                errorText: controller.nameErrorMessage,
                onChangedCallback: controller.setName,
              ),
              BasicTextFormField(
                width: formWidth,
                label: 'Email',
                maxLength: 50,
                inputType: TextInputType.emailAddress,
                errorText: controller.emailErrorMessage,
                onChangedCallback: controller.setEmail,
              ),
              BasicTextFormField(
                width: formWidth,
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
              const SizedBox(height: 30),
              Observer(
                builder: (_) {
                  if (controller.requestSignUpObsFuture?.status ==
                      FutureStatus.pending) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return _buildSignUpButton();
                },
              ),
              _buildHasAccountMessage(),
              const SizedBox(height: 15),
              const SignInSignUpSocialNetworkWidget(),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildSignUpButton() {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        child: DefaultButton(
            color: Theme.of(context).primaryColor,
            widget: const Text(
              'Criar conta',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            callback: controller.isFormValid
                ? () async {
                    await controller.signUp();
                  }
                : null),
      ),
    );
  }

  Row _buildHasAccountMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Já possui uma conta?'),
        TextButton(onPressed: () {}, child: Text('Login'))
      ],
    );
  }
}
