import 'package:anber/Components/neu_box.dart';
import 'package:anber/Models/sakka.dart';
import 'package:anber/Models/sakka_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      size: 30,
                    )),
                SizedBox(
                  width: 150,
                  height: 70,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Text(
                        "السجل",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: context
                    .read<SakkaDatabase>()
                    .fetchSakkas(), // Assuming loadData fetches your data
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Error loading data"));
                  } else {
                    List<Sakka> currentSakkas =
                        Provider.of<SakkaDatabase>(context).currentSakkas;
                    // if (currentSakkas.last.lhm_score < 152 &&
                    //     currentSakkas.last.lna_score < 152) {
                    //   currentSakkas.removeLast();
                    // }
                    List<Sakka> currentSakkasReversed =
                        currentSakkas.reversed.toList();

                    if (currentSakkasReversed.isEmpty) {
                      return Center(
                          child: Text(
                        "لا توجد صكه",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ));
                    }

                    return ListView.builder(
                      itemCount: currentSakkasReversed.length,
                      itemBuilder: (context, index) {
                        Sakka sakka = currentSakkasReversed[index];
                        bool SakkaNotEnded = false;
                        if (sakka.lhm_score < 152 && sakka.lna_score < 152) {
                          SakkaNotEnded = true;
                        }

                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: NeuBox(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        context
                                            .read<SakkaDatabase>()
                                            .deleteSakka(sakka.id);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 19,
                                      )),
                                  SakkaNotEnded
                                      ? Text(
                                          "!لم تنتهي",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                          ),
                                        )
                                      : Opacity(
                                          opacity: 0,
                                          child: Text(
                                            "!لم تنتهي",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .inversePrimary,
                                            ),
                                          ),
                                        ),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "لهم",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .inversePrimary,
                                            ),
                                          ),
                                          Text(
                                            "${sakka.lhm_score}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .inversePrimary,
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "لنا",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .inversePrimary,
                                            ),
                                          ),
                                          Text(
                                            "${sakka.lna_score}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 19,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .inversePrimary,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
