// ignore_for_file: non_constant_identifier_names

import 'package:anber/Components/my_button.dart';
import 'package:anber/Components/neu_box.dart';
import 'package:anber/Components/neu_box_button.dart';
import 'package:anber/Components/score_dialog.dart';
import 'package:anber/Components/win_dialog.dart';
import 'package:anber/Models/sakka.dart';
import 'package:anber/Models/sakka_database.dart';
import 'package:anber/Themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewSakka extends StatefulWidget {
  final int sakka_id;
  const NewSakka({super.key, required this.sakka_id});

  @override
  State<NewSakka> createState() => _NewSakkaState();
}

class _NewSakkaState extends State<NewSakka> {
  late final TextEditingController lna_controller;
  late final TextEditingController lhm_controller;
  late final FocusNode lhm_node;
  late List sakka_score;
  late List<List<int>> sakka_score_history;

  bool isWinLna = false;
  bool isWinLhm = false;
  var loaded = false;

  ScrollController _scrollController1 = ScrollController();
  ScrollController _scrollController2 = ScrollController();

  scrollToBottom() {
    _scrollController1.jumpTo(_scrollController1.position.maxScrollExtent);
    _scrollController2.jumpTo(_scrollController2.position.maxScrollExtent);
  }

  @override
  void initState() {
    super.initState();
    lna_controller = TextEditingController();
    lhm_controller = TextEditingController();
    lhm_node = FocusNode();
    sakka_score_history = [[], []];
    sakka_score = [0, 0];
  }

  @override
  void dispose() {
    super.dispose();
    lna_controller.dispose();
    lhm_controller.dispose();
    lhm_node.dispose();
    context.read<SakkaDatabase>().sakkaEnded(widget.sakka_id);
  }

  void IncrementPressed(BuildContext context) {
    getScore();
    showDialog(
      context: context,
      builder: (context) {
        return ScoreDialog(
          lhm_controller: lhm_controller,
          lhm_node: lhm_node,
          lna_controller: lna_controller,
          sakka_id: widget.sakka_id,
          sakka_score_history: sakka_score_history,
          showWinDialog: checkWinCondition, // Pass the win condition checker,
        );
      },
    );
  }

  void RedoPressed() {
    int last_lna = sakka_score_history[0].removeLast();
    int last_lhm = sakka_score_history[1].removeLast();
    context
        .read<SakkaDatabase>()
        .removeLastScore(widget.sakka_id, last_lna, last_lhm);
  }

  void getScore() async {
    sakka_score = await context.read<SakkaDatabase>().GetScore(widget.sakka_id);
    print(sakka_score);
    print(sakka_score_history);
  }

  void checkWinCondition() {
    int lna = sakka_score_history[0].fold(0, (sum, element) => sum + element);
    int lhm = sakka_score_history[1].fold(0, (sum, element) => sum + element);

    if (lna >= 152 || lhm >= 152) {
      if (lna > lhm) {
        isWinLna = true;
      } else if (lhm > lna) {
        isWinLhm = true;
      }

      showWinDialog();
    }
  }

  void showWinDialog() {
    if (isWinLna) {
      showDialog(
        context: context,
        builder: (context) {
          return WinDialog(
            isLnaWin: true,
            redo: RedoPressed,
          );
        },
      );
    }
    if (isWinLhm) {
      showDialog(
        context: context,
        builder: (context) {
          return WinDialog(
            isLnaWin: false,
            redo: RedoPressed,
          );
        },
      );
    }
  }

  void replayPressed() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          content: Text(
            "هل انت متأكد من إعادة الصكه؟",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 18),
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
                    onTap: () async {
                      Navigator.pop(context);
                      int sakka_id =
                          await context.read<SakkaDatabase>().CreateSakka();
                      await Future.delayed(const Duration(milliseconds: 30));
                      if (context.mounted) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewSakka(
                                sakka_id: sakka_id,
                              ),
                            ));
                      }
                    },
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // sakka database
    final sakkaDatabase = context.watch<SakkaDatabase>();

    //current sakkas
    List<Sakka> currentSakka = sakkaDatabase.currentSakkas;
    int lhm = currentSakka.last.lhm_score;
    int lna = currentSakka.last.lna_score;
    if (lna >= 152 || lhm >= 152) {
      if (lna > lhm) {
        isWinLna = true;
      } else if (lhm > lna) {
        isWinLhm = true;
      }
    }
    if (loaded)
      WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
    getScore();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Buttons
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Back button
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              size: 30,
                            )),
                        // Replay Button
                        SizedBox(
                          height: 40,
                          child: NeuBoxButton(
                              color: Colors.transparent,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: MaterialButton(
                                onPressed: replayPressed,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Text(
                                  "اعاده",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary),
                                ),
                              )),
                        ),
                      ],
                    ),
                    // DarkMode Button
                    IconButton(
                        onPressed: () =>
                            Provider.of<ThemeProvider>(context, listen: false)
                                .toggleTheme(),
                        icon: Icon(
                          Provider.of<ThemeProvider>(context).isDarkMode
                              ? Icons.light_mode_outlined
                              : Icons.dark_mode_rounded,
                          color: Theme.of(context).colorScheme.inversePrimary,
                          size: 30,
                        )),
                  ],
                ),
              ),
              // lna lhm titles and current scores
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NeuBox(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(12)),
                          width: 100,
                          child: Column(
                            children: [
                              Text(
                                "لهم",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              Text(
                                "${currentSakka.last.lhm_score}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              )
                            ],
                          ),
                        )),
                    NeuBox(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(12)),
                          width: 100,
                          child: Column(
                            children: [
                              Text(
                                "لنا",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              Text(
                                "${currentSakka.last.lna_score}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                child: Divider(
                  color: Colors.grey.shade600,
                ),
              ),
              // row -> two list views to show past results
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Lhm score history
                      SizedBox(
                          width: 40,
                          height: 300,
                          child: ScoreBuilder(sakka_score_history[1].length,
                              sakka_score_history[1], _scrollController2)),
                      // divider
                      VerticalDivider(
                        color: Theme.of(context).colorScheme.secondary,
                        indent: 15,
                        endIndent: 15,
                      ),
                      // Lna score history
                      SizedBox(
                          width: 40,
                          height: 300,
                          child: ScoreBuilder(sakka_score_history[0].length,
                              sakka_score_history[0], _scrollController1)),
                    ],
                  ),
                ),
              )
              //
              // button ("ADD") -> show dialog to increment scores
              ,
              Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 10, right: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: NeuBoxButton(
                          color: Colors.red.shade400,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: MaterialButton(
                            // TODO:
                            onPressed: RedoPressed,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Text(
                              "تراجع",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: NeuBoxButton(
                          color: Colors.orange.shade200,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: MaterialButton(
                            onPressed: () => IncrementPressed(context),
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Text(
                              "تسجيل",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Show score history
  Widget? ScoreBuilder(
      int itemCount, List text, ScrollController _scrollController) {
    loaded = true;
    return ListView.builder(
      itemCount: itemCount,
      controller: _scrollController,
      itemBuilder: (context, index) {
        return Text(
          "${text[index]}",
          style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).colorScheme.inversePrimary),
        );
      },
    );
  }
}
