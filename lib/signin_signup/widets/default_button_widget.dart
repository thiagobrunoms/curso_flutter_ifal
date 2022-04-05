import 'package:curso_ifal_flutter/signin_signup/signup_controller.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final void Function()? callback;

  const DefaultButton({
    Key? key,
    required this.title,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
