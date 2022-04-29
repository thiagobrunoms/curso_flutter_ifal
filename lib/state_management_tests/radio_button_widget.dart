import 'package:curso_ifal_flutter/state_management_tests/radio_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class RadioButtonPage extends StatefulWidget {
  const RadioButtonPage({Key? key}) : super(key: key);

  @override
  State<RadioButtonPage> createState() => _RadioButtonPageState();
}

class _RadioButtonPageState extends State<RadioButtonPage> {
  late RadioButtonController controller;

  @override
  void initState() {
    super.initState();

    controller = RadioButtonController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return SafeArea(
            child: Column(
              children: [
                RadioListTile<String>(
                  value: 'Masculino',
                  groupValue: controller.selected,
                  onChanged: (selected) {
                    controller.checkSelected(selected!);
                  },
                  title: const Text('Masculino'),
                ),
                RadioListTile<String>(
                  value: 'Feminino',
                  groupValue: controller.selected,
                  onChanged: (selected) {
                    controller.checkSelected(selected!);
                  },
                  title: const Text('Feminino'),
                ),
                RadioListTile<String>(
                  value: 'Prefiro não informar',
                  groupValue: controller.selected,
                  onChanged: (selected) {
                    controller.checkSelected(selected!);
                  },
                  title: const Text('Não informar'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
