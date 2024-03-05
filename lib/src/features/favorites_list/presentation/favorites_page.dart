import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_flutter/src/common/consts/spacers.dart';

import 'package:rick_morty_flutter/src/common/presentation/custom_card.dart';
import 'package:rick_morty_flutter/src/features/favorites_list/application/favorites_list_provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<FavoritesListProvider>(
      builder: (context, provider, child) {
        return provider.favoriteCharacters.isEmpty
            ? Center(
                child: Text(
                  'No favorite characters added',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              )
            : Column(
                children: [
                  AppSizes.large(),
                  const Text(
                    'List of Favorites Characters',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  AppSizes.large(),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 350,
                        crossAxisCount: screenWidth > 720 ? 2 : 1,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: provider.favoriteCharacters.length,
                      itemBuilder: (context, index) {
                        return CustomCard(
                          character: provider.favoriteCharacters[index],
                        );
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}