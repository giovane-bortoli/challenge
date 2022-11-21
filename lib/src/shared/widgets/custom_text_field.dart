import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? label;
  final String? hint;
  final String? helperText;
  final Function(String)? onChanged;
  final InputDecoration? decoration;
  final bool? obscureText;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.label,
    this.hint,
    this.helperText,
    this.onChanged,
    this.decoration,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            obscureText: obscureText ?? false,
            controller: controller,
            onChanged: onChanged,
            decoration: decoration,
          ),
        ],
      ),
    );
  }
}
