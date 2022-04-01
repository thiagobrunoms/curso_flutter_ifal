import 'package:curso_ifal_flutter/state_management_tests/stream_page_controller_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class StreamPageMobx extends StatefulWidget {
  const StreamPageMobx({Key? key}) : super(key: key);

  @override
  State<StreamPageMobx> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPageMobx> {
  late ReactionDisposer myDisposer;
  late FormController formController;

  @override
  void initState() {
    super.initState();

    formController = FormController();

    myDisposer = reaction<bool>((_) => formController.isChecked, (isChecked) {
      showMessage('Valor de isChecked alterado!!! $isChecked');
    });
  }

  @override
  void dispose() {
    print('Chamando disposer!');
    myDisposer();
    super.dispose();
  }

  void showMessage(String content) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {
            return Column(
              children: [
                Checkbox(
                  value: formController.isChecked,
                  onChanged: (userChecked) {
                    formController.check(userChecked!);
                  },
                ),
                if (formController.isChecked)
                  TextField(
                    decoration: InputDecoration(
                      label: Text('Nome'),
                    ),
                    onChanged: (content) {
                      formController.changeName(content);
                    },
                  ),
                if (formController.isChecked) Text('${formController.name}'),
                Text("${formController.computingResult}"),
                ElevatedButton(
                  onPressed: () async {
                    String data = await formController.getDataFromDatabase();
                    print('Dado retornado: $data');
                  },
                  child: Text('Enviar'),
                ),
                FutureBuilder<String>(
                  future: formController.getDataFromDatabase(),
                  builder: (context, snapshot) {
                    if (formController.connectToDB!.status ==
                        FutureStatus.pending) {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.width * 0.1,
                          child: const CircularProgressIndicator());
                    }

                    return Text(snapshot.data!);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


// return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Checkbox(
//                           value: checkboxSnapshot.data ?? false,
//                           onChanged: (userChecked) {
//                             controller.checkboxSink.add(userChecked!);
//                           },
//                         ),
//                         if (checkboxSnapshot.data!)
//                           TextField(
//                             decoration: InputDecoration(
//                               label: Text('Nome'),
//                             ),
//                             onChanged: (content) {
//                               controller.nameSink.add(content);
//                             },
//                           ),
//                         if (checkboxSnapshot.data!)
//                           Text('${nameSnapshot.data ?? ""}')
//                       ],
//                     );