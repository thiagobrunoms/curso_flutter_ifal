import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InfraModule extends Module {
  late Dio dio;

  InfraModule() {
    dio = Dio();
    dio.options.baseUrl = "http://192.168.0.101:3000";
  }

  @override
  List<Bind> get binds => [
        Bind.singleton((i) => dio, export: true),
      ];
}
