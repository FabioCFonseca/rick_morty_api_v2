import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/src/common/presentation/home_page.dart';

Future<void> main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Variáveis de esquema de cores para o app
  Color get primaryColor => const Color(0xff00A9D4);
  Color get backgroundColor => const Color(0xff2B2D32);
  Color get cardColor => const Color(0xffF2F2F2);
  Color get borderColor => const Color(0xffA333C8);
  Color get bottomNavColor => const Color(0xff006782);

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: primaryColor);

    final themeData = ThemeData(
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Blippo',
          fontSize: 32.0,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Blippo',
          fontSize: 24.0,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Blippo',
          fontSize: 16.0,
          color: Colors.white,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Blippo',
          fontSize: 18.0,
          fontWeight: FontWeight.w100,
          color: Colors.black,
        ),
      ),
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundColor,
      cardTheme: CardTheme(
        color: cardColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: bottomNavColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
      ),
      useMaterial3: false,
    );

    return MaterialApp(
      title: 'Rick & Morty API',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const HomePage(),
    );
  }
}
