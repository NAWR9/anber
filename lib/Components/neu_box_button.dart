import 'package:anber/Themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NeuBoxButton extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Color color;
  const NeuBoxButton(
      {super.key,
      required this.child,
      required this.padding,
      required this.color});

  @override
  Widget build(BuildContext context) {
    // is drak mode
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            // darker shadow on bottom right
            BoxShadow(color: color, blurRadius: 15, offset: Offset(4, 4)),
            // lighter shadow on top left
            BoxShadow(
                color: isDarkMode ? Colors.grey.shade800 : Colors.white,
                blurRadius: 15,
                offset: Offset(-4, -4)),
          ]),
      padding: padding,
      child: child,
    );
  }
}
