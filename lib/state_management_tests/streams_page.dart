// import 'package:curso_ifal_flutter/state_management_tests/stream_page_controller_mobx.dart';
// import 'package:flutter/material.dart';

// class StreamPage extends StatefulWidget {
//   const StreamPage({Key? key}) : super(key: key);

//   @override
//   State<StreamPage> createState() => _StreamPageState();
// }

// class _StreamPageState extends State<StreamPage> {
//   StreamPageController controller = StreamPageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: StreamBuilder<bool>(
//           stream: controller.checkboxStream,
//           initialData: false,
//           builder: (context, checkboxSnapshot) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 StreamBuilder<String>(
//                   stream: controller.nameStream,
//                   initialData: '',
//                   builder: (context, nameSnapshot) {
//                     return Column(
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
//                   },
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
