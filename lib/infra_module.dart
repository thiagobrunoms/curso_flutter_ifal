import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InfraModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
            (i) => Dio(BaseOptions(baseUrl: 'http://10.2.2.0:3000')),
            export: true),
      ];
}
