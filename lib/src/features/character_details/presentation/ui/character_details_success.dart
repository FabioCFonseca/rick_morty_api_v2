import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_flutter/src/common/consts/spacers.dart';

import 'package:rick_morty_flutter/src/features/character_details/provider/character_details_provider.dart';

class CharacterDetailsSuccess extends StatelessWidget {
  const CharacterDetailsSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterDetailsProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              AppSizes.large(),
              const Text(
                'Characters Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              AppSizes.large(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    if (provider.character.image.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(provider.character.image),
                      ),
                    AppSizes.medium(),
                    Text(
                      provider.character.name,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    AppSizes.small(),
                    Text(
                      'ID: ${provider.character.id}',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    AppSizes.medium(),
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Color(0xFF70A2D6),
                          size: 25.0,
                        ),
                        AppSizes.small(),
                        Text('Specie: ${provider.character.species}'),
                      ],
                    ),
                    AppSizes.small(),
                    Row(
                      children: [
                        const Icon(
                          Icons.transgender,
                          color: Color(0xFF70A2D6),
                          size: 25.0,
                        ),
                        AppSizes.small(),
                        Text('Gender: ${provider.character.gender}'),
                      ],
                    ),
                    AppSizes.small(),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(0xFF70A2D6),
                          size: 25.0,
                        ),
                        AppSizes.small(),
                        Text('Origin: ${provider.character.origin}'),
                      ],
                    ),
                    AppSizes.small(),
                    Row(
                      children: [
                        const Icon(
                          Icons.compare_arrows,
                          color: Color(0xFF70A2D6),
                          size: 25.0,
                        ),
                        AppSizes.small(),
                        Text('Status: ${provider.character.status}'),
                      ],
                    ),
                    AppSizes.small(),
                    Row(
                      children: [
                        const Icon(
                          Icons.contact_emergency_outlined,
                          color: Color(0xFF70A2D6),
                          size: 25.0,
                        ),
                        AppSizes.small(),
                        Text('Type: ${provider.character.type}'),
                      ],
                    ),
                  ],
                ),
              ),
              AppSizes.large()
            ],
          ),
        );
      },
    );
  }
}