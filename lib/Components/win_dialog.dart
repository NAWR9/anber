import 'package:anber/Components/my_button.dart';
import 'package:anber/Pages/result_page.dart';
import 'package:flutter/material.dart';

class WinDialog extends StatelessWidget {
  final bool isLnaWin;
  final void Function() redo;
  const WinDialog({super.key, required this.isLnaWin, required this.redo});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: Text(
        "هل انت متأكد من انهاء الصكه؟",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary, fontSize: 18),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: MyButton(
                text: "الغاء",
                onTap: () {
                  Navigator.pop(context);
                  redo();
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: MyButton(
                text: "تأكيد",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(),
                      ));
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
          ],
        )
      ],
    );
  }
}
