import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/mocked_data/card_mocked_data.dart';
import 'package:rick_morty_flutter/src/common/consts/spacers.dart';

import 'package:rick_morty_flutter/src/common/presentation/custom_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    var favoriteCharacters = CharacterRepositoryMock.getCharacters();

    return Column(
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
            itemCount: favoriteCharacters.length,
            itemBuilder: (context, index) {
              return CustomCard(
                character: favoriteCharacters[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
