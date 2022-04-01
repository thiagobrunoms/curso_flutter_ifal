import 'package:curso_ifal_flutter/state_management_tests/service.dart';
import 'package:mobx/mobx.dart';
part 'stream_page_controller_mobx.g.dart';

class FormController = _FormControllerBase with _$FormController;

abstract class _FormControllerBase with Store {
  Service service = Service();

  @observable
  ObservableFuture<String>? connectToDB;

  @observable
  bool isChecked = false;

  @observable
  String name = 'Thiago';

  @action
  void check(bool isChecked) {
    this.isChecked = isChecked;
  }

  @action
  void changeName(String name) {
    this.name = name;
  }

  @computed
  String get computingResult => isChecked ? '$name $isChecked' : '$name';

  Future<String> getDataFromDatabase() async {
    connectToDB = ObservableFuture(service.loadData());

    String data = await connectToDB!;

    return data;
  }
}
