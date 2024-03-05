import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentPage;
  final ValueSetter<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentPage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 50,
      iconSize: 26,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: currentPage,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
      ],
      onTap: onTap,
    );
  }
}