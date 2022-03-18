import 'package:flutter/material.dart';

class MainPageBarWidget extends StatelessWidget {
  const MainPageBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Good Morning!',
          style: TextStyle(fontSize: 25),
        ),
        Text(
          'Dr. Adam',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
