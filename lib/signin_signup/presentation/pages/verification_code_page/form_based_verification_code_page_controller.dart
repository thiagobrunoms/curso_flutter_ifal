import 'package:mobx/mobx.dart';
part 'form_based_verification_code_page_controller.g.dart';

class FormBasedVerificationCodePageController = _FormBasedVerificationCodePageControllerBase
    with _$FormBasedVerificationCodePageController;

abstract class _FormBasedVerificationCodePageControllerBase with Store {
  @observable
  String? field1;

  @observable
  String? field2;

  @observable
  String? field3;

  @observable
  String? field4;

  @action
  void setField1(String field1) => this.field1 = field1;

  @action
  void setField2(String field2) => this.field2 = field2;

  @action
  void setField3(String field3) => this.field3 = field3;

  @action
  void setField4(String field4) => this.field4 = field4;

  @computed
  bool get isValid =>
      field1 != null &&
      field1?.length == 1 &&
      field2 != null &&
      field2?.length == 1 &&
      field3 != null &&
      field3?.length == 1 &&
      field4 != null &&
      field4?.length == 1;

  Future<void> sendVerificationCode() async {
    String code = '$field1$field2$field3$field4';

    //USECASE!!!
  }
}
