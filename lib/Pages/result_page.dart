import 'package:anber/Components/neu_box_button.dart';
import 'package:anber/Models/sakka.dart';
import 'package:anber/Models/sakka_database.dart';
import 'package:anber/Pages/new_sakka.dart';
import 'package:anber/Themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    // sakka database
    final sakkaDatabase = context.watch<SakkaDatabase>();

    //current sakkas
    Sakka currentSakka = sakkaDatabase.currentSakkas.last;

    int lna_score = currentSakka.lna_score;
    int lhm_score = currentSakka.lhm_score;
    int winner_score;
    int loser_score;
    String winner;
    String loser;
    if (lna_score > lhm_score) {
      winner_score = lna_score;
      winner = 'لنا';
      loser_score = lhm_score;
      loser = 'لهم';
    } else {
      winner_score = lhm_score;
      winner = 'لهم';
      loser_score = lna_score;
      loser = 'لنا';
    }

    // is drak mode
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  (الفريق الفائز)
              Center(
                child: Text(
                  "مبرووك",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // row (score , name)
              Container(
                height: 100,
                width: 270,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      // darker shadow on bottom right
                      BoxShadow(
                          color:
                              isDarkMode ? Colors.black : Colors.grey.shade500,
                          blurRadius: 15,
                          offset: Offset(4, 4)),
                      // lighter shadow on top left
                      BoxShadow(
                          color:
                              isDarkMode ? Colors.grey.shade800 : Colors.white,
                          blurRadius: 15,
                          offset: Offset(-4, -4)),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${winner_score}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Text(
                      winner,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),

              //  (حظ اوفر لـ)
              Center(
                child: Text(
                  "حظ اوفر",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // row (score , name)
              Container(
                height: 70,
                width: 240,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      // darker shadow on bottom right
                      BoxShadow(
                          color:
                              isDarkMode ? Colors.black : Colors.grey.shade500,
                          blurRadius: 15,
                          offset: Offset(4, 4)),
                      // lighter shadow on top left
                      BoxShadow(
                          color:
                              isDarkMode ? Colors.grey.shade800 : Colors.white,
                          blurRadius: 15,
                          offset: Offset(-4, -4)),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${loser_score}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    Text(
                      loser,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // row (replay , home)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50),
                child: Row(
                  children: [
                    Expanded(
                      child: NeuBoxButton(
                          color: Colors.red.shade400,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: MaterialButton(
                            // TODO:
                            onPressed: () => Navigator.pop(context),
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Text(
                              "الرئيسية",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
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
                            onPressed: () async {
                              int sakka_id = await context
                                  .read<SakkaDatabase>()
                                  .CreateSakka();
                              await Future.delayed(
                                  const Duration(milliseconds: 30));
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
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Text(
                              "إعادة الصكه",
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
}
