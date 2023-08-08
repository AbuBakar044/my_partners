import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextInputType? keyboardType;
  const CustomFormField({
    super.key,
    this.controller,
    this.hint,
    this.validator,
    this.maxLines,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
