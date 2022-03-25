import 'package:curso_ifal_flutter/signin_signup/signin_signup_controller.dart';
import 'package:flutter/material.dart';

class FormData {
  String nome = '';
  String email = '';
  String senha = '';
}

class SignInSingUpPage extends StatefulWidget {
  const SignInSingUpPage({Key? key}) : super(key: key);

  @override
  State<SignInSingUpPage> createState() {
    print('createState chamado!');

    return _SignInSingUpPageState();
  }
}

class _SignInSingUpPageState extends State<SignInSingUpPage> {
  late SignInSignUpController signupController;

  @override
  void initState() {
    super.initState();

    signupController = SignInSignUpController();
  }

  @override
  void dispose() {
    signupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Build chamado! $mounted');
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cadastro'),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: StreamBuilder<String>(
                  stream: signupController.nameStream,
                  builder: (context, snapshot) {
                    return TextFormField(
                      decoration: InputDecoration(
                        label: Text('Nome'),
                        hintText: 'Fulano de Tal',
                        errorText:
                            snapshot.error == null ? null : "${snapshot.error}",
                      ),
                      onChanged: (input) {
                        signupController.nameSink.add(input);
                      },
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text('Email'),
                  hintText: 'fulano@provedor.com',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text('Senha'),
                  hintText: '*****',
                ),
                obscureText: true,
                validator: (input) {
                  if (input != null && input.length < 8) {
                    return 'Senha deve ter mais de 8 caracteres!';
                  }

                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('Salvar!'),
            ),
            StreamBuilder<String>(
                stream: signupController.nameStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Text('Nome do usuario não existe!');

                  return Text('Nome usuario: ${snapshot.data}');
                })
          ],
        ),
      ),
    );
  }
}
