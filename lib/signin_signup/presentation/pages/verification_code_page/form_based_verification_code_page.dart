import 'package:curso_ifal_flutter/signin_signup/data/datasources/rest_signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/pages/signin_signup_base_page.dart';

import 'package:curso_ifal_flutter/signin_signup/presentation/pages/verification_code_page/form_based_verification_code_page_controller.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/routes.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/basic_text_form_field_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/default_button_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/signin_signup_app_bar_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/signin_signup_title_widget.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class FormBasedVerificationCodePage extends StatefulWidget {
  const FormBasedVerificationCodePage({Key? key}) : super(key: key);

  @override
  State<FormBasedVerificationCodePage> createState() =>
      _FormBasedVerificationCodePageState();
}

class _FormBasedVerificationCodePageState
    extends State<FormBasedVerificationCodePage> {
  late UserEntity userEntity;
  FormBasedVerificationCodePageController? controller;
  final FocusNode focusNodeField2 = FocusNode();
  final FocusNode focusNodeField3 = FocusNode();
  final FocusNode focusNodeField4 = FocusNode();
  late ReactionDisposer verifyCodeResultDisposer;

  @override
  void initState() {
    controller = FormBasedVerificationCodePageController();
    controller?.setDatasource(RestSignUpDatasource(Dio()));

    reaction((_) => controller?.verifiyCodeResult, handleVerifyCodeResult);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    userEntity = ModalRoute.of(context)?.settings.arguments as UserEntity;
    controller?.setUserEntity = userEntity;
  }

  @override
  void dispose() {
    focusNodeField2.dispose();
    focusNodeField3.dispose();
    focusNodeField4.dispose();
    verifyCodeResultDisposer();

    super.dispose();
  }

  void handleVerifyCodeResult(dartz.Either<Failure, bool>? result) {
    result?.fold(
        (l) => showResultDialog('Falha', l.errorMessage, 'Repetir'),
        (r) => Navigator.pushReplacementNamed(context, toMainPage,
            arguments: userEntity));
  }

  void showResultDialog(String title, String content, String action) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(action),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double formWidth = MediaQuery.of(context).size.width * 0.2;

    return SignInSignUpBasePage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SignInSignUpAppBarWidget(),
          const SizedBox(height: 40),
          const SignInSignUpTitleWidget(titleList: ['Verificar', 'Código']),
          const SizedBox(height: 40),
          Text(
            'Um código foi enviado para ${userEntity.email}',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BasicTextFormField(
                hintText: '*',
                maxLength: 1,
                width: formWidth,
                nextFocusNode: focusNodeField2,
                onChangedCallback: controller?.setField1,
                inputType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
              BasicTextFormField(
                hintText: '*',
                maxLength: 1,
                width: formWidth,
                focusNode: focusNodeField2,
                nextFocusNode: focusNodeField3,
                onChangedCallback: controller?.setField2,
                inputType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
              BasicTextFormField(
                hintText: '*',
                maxLength: 1,
                width: formWidth,
                focusNode: focusNodeField3,
                nextFocusNode: focusNodeField4,
                onChangedCallback: controller?.setField3,
                inputType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
              BasicTextFormField(
                hintText: '*',
                maxLength: 1,
                width: formWidth,
                focusNode: focusNodeField4,
                onChangedCallback: controller?.setField4,
                inputType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 40),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey, fontSize: 17),
                children: [
                  const TextSpan(text: 'Não recebi o código. '),
                  TextSpan(
                    text: 'Reenviar',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => print('enviar solicitação de reenvio...'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            child: Observer(builder: (_) {
              if (controller?.sendVerificationCodeObsFuture != null &&
                  controller?.sendVerificationCodeObsFuture?.status ==
                      FutureStatus.pending) {
                return const CircularProgressIndicator();
              }

              return DefaultButton(
                color: Theme.of(context).primaryColor,
                widget: const Text(
                  'Enviar código',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                callback: controller!.isValid
                    ? () {
                        controller?.sendVerificationCode();
                      }
                    : null,
              );
            }),
          )
        ],
      ),
    );
  }
}
