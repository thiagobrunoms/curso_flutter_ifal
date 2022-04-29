import 'package:curso_ifal_flutter/signin_signup/data/datasources/google_signup_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/default_button_widget.dart';
import 'package:curso_ifal_flutter/signin_signup/presentation/widgets/social_network/signin_signup_social_network_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignInSignUpSocialNetworkWidget extends StatefulWidget {
  const SignInSignUpSocialNetworkWidget({Key? key}) : super(key: key);

  @override
  State<SignInSignUpSocialNetworkWidget> createState() =>
      _SignInSignUpSocialNetworkWidgetState();
}

class _SignInSignUpSocialNetworkWidgetState
    extends State<SignInSignUpSocialNetworkWidget> {
  SignInSignUpSocialNetworkWidgetController? controller;

  @override
  void initState() {
    super.initState();

    controller = Modular.get<SignInSignUpSocialNetworkWidgetController>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildContinueMessage(),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _buildSocialNetworksButtons(
                  'assets/images/google.png', 'Google', () async {
                controller?.googleSignUp();
              }),
            ),
            Expanded(
              child: _buildSocialNetworksButtons(
                  'assets/images/facebook.png', 'Facebook', () {}),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContinueMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Flexible(
          flex: 1,
          child: Divider(
            height: 10,
            color: Colors.black,
          ),
        ),
        Flexible(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(
              left: 5.0,
              right: 5.0,
            ),
            child: Text('Ou continuar com'),
          ),
        ),
        Flexible(
          flex: 1,
          child: Divider(
            height: 10,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialNetworksButtons(
      String logoPath, String socialName, void Function() callback) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: DefaultButton.socialNetworks(
        callback: callback,
        widget: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 1,
                child: Image.asset(
                  logoPath,
                  width: 20,
                  height: 20,
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(socialName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
