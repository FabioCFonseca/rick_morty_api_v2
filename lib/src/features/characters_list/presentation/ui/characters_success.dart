import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_flutter/src/common/consts/spacers.dart';

import 'package:rick_morty_flutter/src/common/presentation/custom_card.dart';
import 'package:rick_morty_flutter/src/features/characters_list/provider/character_list_provider.dart';

class CharactersSuccess extends StatelessWidget {
  const CharactersSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<CharacterListProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            AppSizes.small(), 
            Text(
              'List of Characters',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 350,
                  crossAxisCount: screenWidth > 720 ? 2 : 1,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: provider.characters.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    character: provider.characters[index],
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