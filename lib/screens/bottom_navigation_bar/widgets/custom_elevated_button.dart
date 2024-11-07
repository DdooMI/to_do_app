import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {required this.onPressed, required this.text, super.key});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ));
  }
}
