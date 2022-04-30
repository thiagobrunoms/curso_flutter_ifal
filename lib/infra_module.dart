import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InfraModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance(
            (i) => Dio(BaseOptions(baseUrl: 'http://192.168.0.101:3000')),
            export: true),
      ];
}
