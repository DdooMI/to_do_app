import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {this.hintText,
      required this.controller,
      this.maxLines,
      this.validator,
      this.readOnly,
      this.color,
      super.key});
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        readOnly: readOnly ?? false,
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        style: TextStyle(
            fontSize: 20, color: Theme.of(context).colorScheme.secondary),
        decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 2)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: color ?? Theme.of(context).colorScheme.secondary,
                    width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: color ?? Theme.of(context).colorScheme.secondary,
                    width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 2)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red, width: 2)),
            hintText: hintText,
            errorStyle: const TextStyle(color: Colors.red),
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.normal)),
      ),
    );
  }
}
