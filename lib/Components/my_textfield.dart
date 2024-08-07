import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hint;
  final String label;
  final bool autofocus;
  final TextEditingController controller;
  final node;
  final void Function(String)? onChanged;

  const MyTextfield(
      {super.key,
      required this.hint,
      required this.autofocus,
      required this.controller,
      this.node,
      required this.onChanged,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: node,
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: autofocus,
      onChanged: onChanged,
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      textAlign: TextAlign.center,
      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      decoration: InputDecoration(
          hoverColor: Theme.of(context).colorScheme.tertiary,
          fillColor: Theme.of(context).colorScheme.primary,
          filled: true,
          border: OutlineInputBorder(),
          label: Text(
            label,
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
            textAlign: TextAlign.center,
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary)),
    );
  }
}
