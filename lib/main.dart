import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_flutter/src/common/presentation/home_page.dart';
import 'package:rick_morty_flutter/src/features/characters_list/infrastructure/characters_list_repository.dart';
import 'package:rick_morty_flutter/src/features/characters_list/provider/character_list_provider.dart';
import 'package:rick_morty_flutter/src/features/favorites_list/application/favorites_list_provider.dart';
import 'package:rick_morty_flutter/src/utils/user_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();

  runApp(
    MultiProvider(
      providers: [
        //Favorites feature
        ChangeNotifierProvider(create: (context) => FavoritesListProvider()),
        // Character List Feature
        Provider(create: (context) => CharactersListRepository()),
        ChangeNotifierProvider(
          create: (context) => CharacterListProvider(
            repository: context.read<CharactersListRepository>(),
          )..controllerStart(context),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors, avoid_unused_constructor_parameters
  const MyApp({Key? key});

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
      cardTheme: CardThemeData(
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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const HomePage(),
    );
  }
}