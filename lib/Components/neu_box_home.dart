import 'package:anber/Themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NeuBoxHome extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  const NeuBoxHome({super.key, required this.child, required this.padding});

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
            BoxShadow(
                color: isDarkMode ? Colors.black : Colors.grey.shade500,
                blurRadius: 8,
                offset: Offset(6, 6)),
            // lighter shadow on top left
          ]),
      padding: padding,
      child: child,
    );
  }
}
