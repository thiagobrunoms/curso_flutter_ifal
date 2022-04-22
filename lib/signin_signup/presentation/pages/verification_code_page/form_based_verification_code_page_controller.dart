import 'package:curso_ifal_flutter/signin_signup/data/datasources/verification_code_datasource.dart';
import 'package:curso_ifal_flutter/signin_signup/data/repositories/signin_signup_repository_impl.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/failures/failure.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/repositories/code_verification_repository.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/form_based_verification_code_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/usecases/verification_code_usecase.dart';
import 'package:curso_ifal_flutter/signin_signup/domain/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
part 'form_based_verification_code_page_controller.g.dart';

class FormBasedVerificationCodePageController = _FormBasedVerificationCodePageControllerBase
    with _$FormBasedVerificationCodePageController;

abstract class _FormBasedVerificationCodePageControllerBase with Store {
  VerificationCodeRepository? verificationCodeRepository;

  @observable
  String? field1;

  @observable
  String? field2;

  @observable
  String? field3;

  @observable
  String? field4;

  UserEntity? userEntity;

  set setUserEntity(UserEntity? userEntity) => this.userEntity = userEntity;

  @action
  void setField1(String field1) => this.field1 = field1;

  @action
  void setField2(String field2) => this.field2 = field2;

  @action
  void setField3(String field3) => this.field3 = field3;

  @action
  void setField4(String field4) => this.field4 = field4;

  @observable
  Either<Failure, bool>? verifiyCodeResult;

  @observable
  ObservableFuture<Either<Failure, bool>>? sendVerificationCodeObsFuture;

  @observable
  String? codeVerificationErrorMessage;

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

  void setDatasource(VerificationCodeDatasource datasource) {
    verificationCodeRepository =
        SignInSignUpRepositoryImpl(verificationCodeDatasource: datasource);
  }

  Future<void> sendVerificationCode() async {
    String code = '$field1$field2$field3$field4';

    VerificationCodeUsecase usecase = FormBasedVerificationCodeUsecase(
        repository: verificationCodeRepository);

    sendVerificationCodeObsFuture = ObservableFuture(usecase(
        param: VerificationCodeParam(code: code, email: userEntity!.email)));

    verifiyCodeResult = await sendVerificationCodeObsFuture;
  }
}
