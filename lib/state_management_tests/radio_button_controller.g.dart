// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_button_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RadioButtonController on _RadioButtonControllerBase, Store {
  final _$selectedAtom = Atom(name: '_RadioButtonControllerBase.selected');

  @override
  String get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(String value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  @override
  String toString() {
    return '''
selected: ${selected}
    ''';
  }
}
