import 'package:curso_ifal_flutter/main/main_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => MainPage(userEntity: args.data)),
      ];
}
