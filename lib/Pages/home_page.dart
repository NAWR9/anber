import 'package:anber/Components/my_button.dart';
import 'package:anber/Components/neu_box.dart';
import 'package:anber/Components/neu_box_home.dart';
import 'package:anber/Models/sakka_database.dart';
import 'package:anber/Pages/history_page.dart';
import 'package:anber/Pages/new_sakka.dart';
import 'package:anber/Themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              child: NeuBox(
                padding: EdgeInsets.all(0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "lib/assets/images/logo.jpeg",
                      height: 160,
                    )),
              ),
            ),
            // Title

            const SizedBox(
              height: 80,
            ),
            // column of buttons [new game, history, exit]
            Center(
              child: Column(
                children: [
                  NeuBoxHome(
                    padding: EdgeInsets.all(0),
                    child: MyButton(
                        text: '! صكه جديده',
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 15),
                        onTap: () async {
                          int sakka_id =
                              await context.read<SakkaDatabase>().CreateSakka();
                          await Future.delayed(
                              const Duration(milliseconds: 30));
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
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  NeuBoxHome(
                    padding: EdgeInsets.all(0),
                    child: MyButton(
                      text: 'الصكات السابقه',
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 15),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistoryPage(),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  NeuBoxHome(
                    padding: const EdgeInsets.all(0),
                    child: MyButton(
                      color: Provider.of<ThemeProvider>(context).isDarkMode
                          ? const Color.fromARGB(255, 124, 19, 19)
                          : Color.fromARGB(255, 222, 96, 96),
                      text: 'الخروج',
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 15),
                      onTap: () => SystemNavigator.pop(),
                    ),
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
