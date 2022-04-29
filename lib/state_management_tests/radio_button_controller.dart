import 'package:mobx/mobx.dart';
part 'radio_button_controller.g.dart';

class RadioButtonController = _RadioButtonControllerBase
    with _$RadioButtonController;

abstract class _RadioButtonControllerBase with Store {
  @observable
  String selected = "";

  void checkSelected(String selected) {
    this.selected = selected;
  }
}
