import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final UserEntity userEntity;
  const MainPage({Key? key, required this.userEntity}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.userEntity.toString()),
    );
  }
}
