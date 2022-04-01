// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_page_controller_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormController on _FormControllerBase, Store {
  Computed<String>? _$computingResultComputed;

  @override
  String get computingResult => (_$computingResultComputed ??= Computed<String>(
          () => super.computingResult,
          name: '_FormControllerBase.computingResult'))
      .value;

  final _$connectToDBAtom = Atom(name: '_FormControllerBase.connectToDB');

  @override
  ObservableFuture<String>? get connectToDB {
    _$connectToDBAtom.reportRead();
    return super.connectToDB;
  }

  @override
  set connectToDB(ObservableFuture<String>? value) {
    _$connectToDBAtom.reportWrite(value, super.connectToDB, () {
      super.connectToDB = value;
    });
  }

  final _$isCheckedAtom = Atom(name: '_FormControllerBase.isChecked');

  @override
  bool get isChecked {
    _$isCheckedAtom.reportRead();
    return super.isChecked;
  }

  @override
  set isChecked(bool value) {
    _$isCheckedAtom.reportWrite(value, super.isChecked, () {
      super.isChecked = value;
    });
  }

  final _$nameAtom = Atom(name: '_FormControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$_FormControllerBaseActionController =
      ActionController(name: '_FormControllerBase');

  @override
  void check(bool isChecked) {
    final _$actionInfo = _$_FormControllerBaseActionController.startAction(
        name: '_FormControllerBase.check');
    try {
      return super.check(isChecked);
    } finally {
      _$_FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeName(String name) {
    final _$actionInfo = _$_FormControllerBaseActionController.startAction(
        name: '_FormControllerBase.changeName');
    try {
      return super.changeName(name);
    } finally {
      _$_FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectToDB: ${connectToDB},
isChecked: ${isChecked},
name: ${name},
computingResult: ${computingResult}
    ''';
  }
}
