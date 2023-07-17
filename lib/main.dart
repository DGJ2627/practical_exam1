import 'package:exam_one/Model/theme_mode;.dart';
import 'package:exam_one/Provider/theme_provider.dart';
import 'package:exam_one/views/screens/Save_page.dart';
import 'package:exam_one/views/screens/home_page.dart';
import 'package:exam_one/views/screens/intro_screens.dart';
import 'package:exam_one/views/screens/mark_page.dart';
import 'package:exam_one/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Global/Global_var.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences perf = await SharedPreferences.getInstance();
  iscompleted_intro = perf.getBool("intro_completed") ?? false;
  iscompleted_theme = perf.getBool("theme_completed") ?? false;
  runApp(
    const Gautam(),
  );
}

class Gautam extends StatefulWidget {
  const Gautam({super.key});

  @override
  State<Gautam> createState() => _GautamState();
}

class _GautamState extends State<Gautam> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              theme_provider(app_theme: theme_model(isDark: false)),
        )
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          colorScheme: ColorScheme.light(
            primary: const Color(0xff37474f),
            secondary: Colors.grey.shade200,
          ),
        ),
        darkTheme: ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          colorScheme: const ColorScheme.dark(
            brightness: Brightness.dark,
            primary: Colors.deepPurpleAccent,
            secondary: Colors.white54,
          ),
        ),
        themeMode: (Provider.of<theme_provider>(context).app_theme.isDark
            ? ThemeMode.light
            : ThemeMode.dark),
        routes: {
          '/': (context) => const intro_screens(),
          'splash_screen': (context) => const splash_screen(),
          'intro_screens': (context) => const intro_screens(),
          'home_page': (context) => const home_page(),
          'mark_page': (context) => const mark_page(),
          'save_page': (context) => const save_page(),
        },
      ),
    );
  }
}
