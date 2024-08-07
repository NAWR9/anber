// ignore_for_file: non_constant_identifier_names

import 'package:anber/Components/my_button.dart';
import 'package:anber/Components/my_textfield.dart';
import 'package:anber/Components/neu_box.dart';
import 'package:anber/Components/neu_box_button.dart';
import 'package:anber/Themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewSakka extends StatefulWidget {
  const NewSakka({super.key});

  @override
  State<NewSakka> createState() => _NewSakkaState();
}

class _NewSakkaState extends State<NewSakka> {
  late final TextEditingController lna_controller;
  late final TextEditingController lhm_controller;
  late final FocusNode lhm_node;

  @override
  void initState() {
    super.initState();
    lna_controller = TextEditingController();
    lhm_controller = TextEditingController();
    lhm_node = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    lna_controller.dispose();
    lhm_controller.dispose();
    lhm_node.dispose();
  }

  void IncrementPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
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
                      lhm_node.unfocus();
                    }
                  },
                  node: lhm_node,
                  controller: lhm_controller,
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
                      lhm_node.requestFocus();
                    }
                  },
                  controller: lna_controller,
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
                    onTap: () => Navigator.pop(context),
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
                    onTap: () {},
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Dark Mode switch
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
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
                  )
                ],
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
                                "155",
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
                                "155",
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
                          child: ScoreBuilder(10, "155")),
                      // divider
                      VerticalDivider(
                        color: Theme.of(context).colorScheme.secondary,
                        indent: 15,
                        endIndent: 15,
                      ),
                      // Lna score history
                      SizedBox(
                          width: 40, height: 300, child: ScoreBuilder(4, "155"))
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
                            onPressed: () {},
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
  Widget? ScoreBuilder(int itemCount, String text) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Text(
          text,
          style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).colorScheme.inversePrimary),
        );
      },
    );
  }
}
