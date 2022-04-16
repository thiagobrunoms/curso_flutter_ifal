import 'package:flutter/material.dart';

class BasicTextFormField extends StatelessWidget {
  final String? label;
  final bool obscureText;
  final int maxLength;
  final TextInputType inputType;
  final String? errorText;
  final Widget? icon;
  final String? hintText;
  final double width;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final void Function(String)? onChangedCallback;

  const BasicTextFormField({
    Key? key,
    this.label,
    required this.maxLength,
    this.inputType = TextInputType.text,
    this.errorText,
    this.onChangedCallback,
    this.obscureText = false,
    this.icon,
    this.hintText,
    required this.width,
    this.focusNode,
    this.nextFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 8),
        child: TextFormField(
          obscureText: obscureText,
          maxLength: maxLength,
          keyboardType: inputType,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
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
          onChanged: (String content) {
            if (nextFocusNode != null) {
              nextFocusNode?.requestFocus();
            }

            if (onChangedCallback != null) {
              onChangedCallback!(content);
            }
          },
        ),
      ),
    );
  }
}
