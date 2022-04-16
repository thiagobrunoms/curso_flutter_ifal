// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_based_verification_code_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormBasedVerificationCodePageController
    on _FormBasedVerificationCodePageControllerBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_FormBasedVerificationCodePageControllerBase.isValid'))
      .value;

  final _$field1Atom =
      Atom(name: '_FormBasedVerificationCodePageControllerBase.field1');

  @override
  String? get field1 {
    _$field1Atom.reportRead();
    return super.field1;
  }

  @override
  set field1(String? value) {
    _$field1Atom.reportWrite(value, super.field1, () {
      super.field1 = value;
    });
  }

  final _$field2Atom =
      Atom(name: '_FormBasedVerificationCodePageControllerBase.field2');

  @override
  String? get field2 {
    _$field2Atom.reportRead();
    return super.field2;
  }

  @override
  set field2(String? value) {
    _$field2Atom.reportWrite(value, super.field2, () {
      super.field2 = value;
    });
  }

  final _$field3Atom =
      Atom(name: '_FormBasedVerificationCodePageControllerBase.field3');

  @override
  String? get field3 {
    _$field3Atom.reportRead();
    return super.field3;
  }

  @override
  set field3(String? value) {
    _$field3Atom.reportWrite(value, super.field3, () {
      super.field3 = value;
    });
  }

  final _$field4Atom =
      Atom(name: '_FormBasedVerificationCodePageControllerBase.field4');

  @override
  String? get field4 {
    _$field4Atom.reportRead();
    return super.field4;
  }

  @override
  set field4(String? value) {
    _$field4Atom.reportWrite(value, super.field4, () {
      super.field4 = value;
    });
  }

  final _$_FormBasedVerificationCodePageControllerBaseActionController =
      ActionController(name: '_FormBasedVerificationCodePageControllerBase');

  @override
  void setField1(String field1) {
    final _$actionInfo =
        _$_FormBasedVerificationCodePageControllerBaseActionController
            .startAction(
                name: '_FormBasedVerificationCodePageControllerBase.setField1');
    try {
      return super.setField1(field1);
    } finally {
      _$_FormBasedVerificationCodePageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setField2(String field2) {
    final _$actionInfo =
        _$_FormBasedVerificationCodePageControllerBaseActionController
            .startAction(
                name: '_FormBasedVerificationCodePageControllerBase.setField2');
    try {
      return super.setField2(field2);
    } finally {
      _$_FormBasedVerificationCodePageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setField3(String field3) {
    final _$actionInfo =
        _$_FormBasedVerificationCodePageControllerBaseActionController
            .startAction(
                name: '_FormBasedVerificationCodePageControllerBase.setField3');
    try {
      return super.setField3(field3);
    } finally {
      _$_FormBasedVerificationCodePageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setField4(String field4) {
    final _$actionInfo =
        _$_FormBasedVerificationCodePageControllerBaseActionController
            .startAction(
                name: '_FormBasedVerificationCodePageControllerBase.setField4');
    try {
      return super.setField4(field4);
    } finally {
      _$_FormBasedVerificationCodePageControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
field1: ${field1},
field2: ${field2},
field3: ${field3},
field4: ${field4},
isValid: ${isValid}
    ''';
  }
}
