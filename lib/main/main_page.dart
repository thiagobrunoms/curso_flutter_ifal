import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late UserEntity userEntity;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    userEntity = ModalRoute.of(context)?.settings.arguments as UserEntity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(userEntity.toString()),
    );
  }
}
