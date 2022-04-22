// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_widget_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInWidgetController on _SignInWidgetControllerBase, Store {
  Computed<bool>? _$isValidEmailComputed;

  @override
  bool get isValidEmail =>
      (_$isValidEmailComputed ??= Computed<bool>(() => super.isValidEmail,
              name: '_SignInWidgetControllerBase.isValidEmail'))
          .value;
  Computed<bool>? _$isValidPasswordComputed;

  @override
  bool get isValidPassword =>
      (_$isValidPasswordComputed ??= Computed<bool>(() => super.isValidPassword,
              name: '_SignInWidgetControllerBase.isValidPassword'))
          .value;
  Computed<String?>? _$emailErrorMessageComputed;

  @override
  String? get emailErrorMessage => (_$emailErrorMessageComputed ??=
          Computed<String?>(() => super.emailErrorMessage,
              name: '_SignInWidgetControllerBase.emailErrorMessage'))
      .value;
  Computed<String?>? _$passwordErrorMessageComputed;

  @override
  String? get passwordErrorMessage => (_$passwordErrorMessageComputed ??=
          Computed<String?>(() => super.passwordErrorMessage,
              name: '_SignInWidgetControllerBase.passwordErrorMessage'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignInWidgetControllerBase.isFormValid'))
          .value;

  final _$emailAtom = Atom(name: '_SignInWidgetControllerBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignInWidgetControllerBase.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$isVisibleAtom = Atom(name: '_SignInWidgetControllerBase.isVisible');

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  final _$signInObsFutAtom =
      Atom(name: '_SignInWidgetControllerBase.signInObsFut');

  @override
  ObservableFuture<Either<Failure, UserEntity>>? get signInObsFut {
    _$signInObsFutAtom.reportRead();
    return super.signInObsFut;
  }

  @override
  set signInObsFut(ObservableFuture<Either<Failure, UserEntity>>? value) {
    _$signInObsFutAtom.reportWrite(value, super.signInObsFut, () {
      super.signInObsFut = value;
    });
  }

  final _$signInErrorMessageAtom =
      Atom(name: '_SignInWidgetControllerBase.signInErrorMessage');

  @override
  String? get signInErrorMessage {
    _$signInErrorMessageAtom.reportRead();
    return super.signInErrorMessage;
  }

  @override
  set signInErrorMessage(String? value) {
    _$signInErrorMessageAtom.reportWrite(value, super.signInErrorMessage, () {
      super.signInErrorMessage = value;
    });
  }

  final _$signInSuccessAtom =
      Atom(name: '_SignInWidgetControllerBase.signInSuccess');

  @override
  bool? get signInSuccess {
    _$signInSuccessAtom.reportRead();
    return super.signInSuccess;
  }

  @override
  set signInSuccess(bool? value) {
    _$signInSuccessAtom.reportWrite(value, super.signInSuccess, () {
      super.signInSuccess = value;
    });
  }

  final _$userEntityAtom = Atom(name: '_SignInWidgetControllerBase.userEntity');

  @override
  UserEntity? get userEntity {
    _$userEntityAtom.reportRead();
    return super.userEntity;
  }

  @override
  set userEntity(UserEntity? value) {
    _$userEntityAtom.reportWrite(value, super.userEntity, () {
      super.userEntity = value;
    });
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
isVisible: ${isVisible},
signInObsFut: ${signInObsFut},
signInErrorMessage: ${signInErrorMessage},
signInSuccess: ${signInSuccess},
userEntity: ${userEntity},
isValidEmail: ${isValidEmail},
isValidPassword: ${isValidPassword},
emailErrorMessage: ${emailErrorMessage},
passwordErrorMessage: ${passwordErrorMessage},
isFormValid: ${isFormValid}
    ''';
  }
}
