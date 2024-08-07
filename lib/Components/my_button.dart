import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final EdgeInsetsGeometry? padding;
  const MyButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
        padding: padding,
        child: Text(
          text,
          style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
