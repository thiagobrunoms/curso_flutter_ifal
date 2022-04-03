import 'package:flutter/material.dart';

class BasicTextFormField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final int maxLength;
  final TextInputType inputType;
  final String? errorText;
  final Widget? icon;
  final void Function(String)? onChangedCallback;

  const BasicTextFormField({
    Key? key,
    required this.label,
    required this.maxLength,
    this.inputType = TextInputType.text,
    this.errorText,
    this.onChangedCallback,
    this.obscureText = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 8),
      child: TextFormField(
        obscureText: obscureText,
        maxLength: maxLength,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: icon,
          fillColor: Colors.white,
          filled: true,
          errorText: errorText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        onChanged: onChangedCallback,
      ),
    );
  }
}
