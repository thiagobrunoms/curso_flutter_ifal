import 'package:flutter/material.dart';

class TopBarBackButtonWidget extends StatelessWidget {
  final void Function()? onTabCallback;

  const TopBarBackButtonWidget({
    Key? key,
    required this.onTabCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTabCallback,
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
