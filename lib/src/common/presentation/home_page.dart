  import 'package:flutter/material.dart';

  import 'package:rick_morty_flutter/src/common/presentation/custom_app_bar.dart';
  import 'package:rick_morty_flutter/src/common/presentation/custom_bottom_nav_bar.dart';
  import 'package:rick_morty_flutter/src/features/characters_list/presentation/characters_list_page.dart';
  import 'package:rick_morty_flutter/src/features/favorites_list/presentation/favorites_page.dart';

  class HomePage extends StatefulWidget {
    const HomePage({Key? key});

    @override
    State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
    late final PageController _pageController;
    int currentPage = 0;

    @override
    void initState() {
      super.initState();
      _pageController = PageController();
    }

    @override
    void dispose() {
      _pageController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: const CustomAppBar(),
        body: PageView(
          controller: _pageController,
          children: const [
            CharactersListPage(),
            FavoritesPage(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentPage: currentPage,
          //Callback do filho para o pai
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
            _pageController.animateToPage(
              currentPage,
              duration: const Duration(milliseconds: 400),
              curve: Curves.ease,
            );
          },
        ),
      );
    }
  }