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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 150,
                  height: 70,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.0),
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
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error loading data"));
                  } else {
                    List<Sakka> currentSakkas =
                        context.read<SakkaDatabase>().currentSakkas;
                    List<Sakka> currentSakkasReversed =
                        currentSakkas.reversed.toList();

                    if (currentSakkasReversed.isEmpty) {
                      return Center(child: Text("No data available"));
                    }

                    return ListView.builder(
                      itemCount: currentSakkasReversed.length,
                      itemBuilder: (context, index) {
                        Sakka sakka = currentSakkasReversed[index];

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
