import 'package:anber/Components/neu_box.dart';
import 'package:anber/Pages/home_page.dart';
import 'package:anber/Themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color dark1 = Colors.grey.shade700;
    Color dark2 = Colors.grey.shade900;
    Color light1 = Colors.grey.shade200;
    Color light2 = Colors.grey.shade500;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: Provider.of<ThemeProvider>(context).isDarkMode
                    ? [dark1, dark2]
                    : [light1, light2],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Center(
          child: NeuBox(
            padding: const EdgeInsets.all(0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "lib/assets/images/logo.jpeg",
                  height: 160,
                )),
          ),
        ),
      ),
    );
  }
}
