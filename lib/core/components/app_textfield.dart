// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final int? maxlines;
  final String? hint;
  final TextEditingController controller;
  final Function(String)? onChanged;
  const AppTextField({
    Key? key,
    this.maxlines,
    this.hint,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 2, color: Colors.white)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(width: 2, color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(width: 2, color: Colors.cyan.withOpacity(.7))),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2, color: Colors.red),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.cyan.withOpacity(.7),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
