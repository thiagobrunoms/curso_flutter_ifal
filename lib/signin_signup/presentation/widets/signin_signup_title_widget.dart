import 'package:flutter/material.dart';

class SignInSignUpTitleWidget extends StatelessWidget {
  final List<String> titleList;

  const SignInSignUpTitleWidget({Key? key, required this.titleList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: titleList.map((eachString) => _getText(eachString)).toList(),
    );
  }

  Widget _getText(String content) => Text(
        content,
        style: const TextStyle(fontSize: 45),
      );
}
