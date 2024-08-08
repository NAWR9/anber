import 'package:anber/Components/my_button.dart';
import 'package:anber/Models/sakka_database.dart';
import 'package:anber/Pages/history_page.dart';
import 'package:anber/Pages/new_sakka.dart';
import 'package:anber/Themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
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
            const SizedBox(
              height: 50,
            ),
            // Logo
            Center(
              child: Icon(Icons.calculate_outlined,
                  size: 90,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            // Title
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "عنبر",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // column of buttons [new game, history, exit]
            Center(
              child: Column(
                children: [
                  MyButton(
                      text: 'Play',
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 15),
                      onTap: () async {
                        int sakka_id =
                            await context.read<SakkaDatabase>().CreateSakka();
                        await Future.delayed(const Duration(milliseconds: 30));
                        if (context.mounted) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewSakka(
                                  sakka_id: sakka_id,
                                ),
                              ));
                        }
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  MyButton(
                    text: 'History',
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 15),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistoryPage(),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyButton(
                    text: 'Exit',
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 15),
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
