// ignore_for_file: non_constant_identifier_names

import 'package:anber/Components/my_button.dart';
import 'package:anber/Components/my_textfield.dart';
import 'package:anber/Components/win_dialog.dart';
import 'package:anber/Models/sakka_database.dart';
import 'package:anber/Pages/new_sakka.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreDialog extends StatefulWidget {
  final TextEditingController lna_controller;
  final TextEditingController lhm_controller;
  final FocusNode lhm_node;
  final int sakka_id;
  final List<List<int>> sakka_score_history; // Accept the list as a parameter
  final void Function() showWinDialog; // Use a Function type for callback
  const ScoreDialog(
      {super.key,
      required this.lhm_controller,
      required this.lhm_node,
      required this.lna_controller,
      required this.sakka_id,
      required this.sakka_score_history,
      required this.showWinDialog});

  @override
  State<ScoreDialog> createState() => _ScoreDialogState();
}

class _ScoreDialogState extends State<ScoreDialog> {
  void ConfirmPressed() {
    var sakka_db = context.read<SakkaDatabase>();
    try {
      int lna = int.parse(widget.lna_controller.text.isEmpty
          ? "0"
          : widget.lna_controller.text);
      int lhm = int.parse(widget.lhm_controller.text.isEmpty
          ? "0"
          : widget.lhm_controller.text);
      sakka_db.increaseScore(widget.sakka_id, lhm, lna);
      widget.sakka_score_history[0].add(lna);
      widget.sakka_score_history[1].add(lhm);
      sakka_db.isWinning(widget.sakka_id);
    } catch (e) {
      print(e);
    }
    Navigator.pop(context);
    widget.lna_controller.clear();
    widget.lhm_controller.clear();
    // Call the win condition checker after updating the score
    widget.showWinDialog();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 70,
            height: 50,
            child: MyTextfield(
              onChanged: (value) {
                if (value.length == 2) {
                  widget.lhm_node.unfocus();
                }
              },
              node: widget.lhm_node,
              controller: widget.lhm_controller,
              autofocus: false,
              hint: "لهم",
              label: "لهم",
            ),
          ),
          SizedBox(
            width: 70,
            height: 50,
            child: MyTextfield(
              onChanged: (value) {
                if (value.length == 2) {
                  widget.lhm_node.requestFocus();
                }
              },
              controller: widget.lna_controller,
              autofocus: true,
              hint: "لنا",
              label: "لنا",
            ),
          ),
        ],
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
                  widget.lna_controller.clear();
                  widget.lhm_controller.clear();
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
                onTap: ConfirmPressed,
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
