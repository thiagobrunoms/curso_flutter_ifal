import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InfraModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
            (i) => Dio(BaseOptions(baseUrl: "http://10.0.10.167:3000")),
            export: true),
      ];
}
