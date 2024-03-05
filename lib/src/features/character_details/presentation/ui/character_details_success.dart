import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/mocked_data/details_mocked_data.dart';
import 'package:rick_morty_flutter/src/common/consts/spacers.dart';

class CharacterDetailsSuccess extends StatelessWidget {
  CharacterDetailsSuccess({super.key});

  var character = CharacterDetailsRepositoryMock.getDetails();

  @override
  Widget build(BuildContext context) {
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
                if (character.image.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(character.image),
                  ),
                AppSizes.medium(),
                Text(
                  character.name,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                AppSizes.small(),
                Text(
                  'ID: ${character.id}',
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
                    Text('Specie: ${character.species}'),
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
                    Text('Gender: ${character.gender}'),
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
                    Text('Origin: ${character.origin}'),
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
                    Text('Status: ${character.status}'),
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
                    Text('Type: ${character.type}'),
                  ],
                ),
              ],
            ),
          ),
          AppSizes.large()
        ],
      ),
    );
    ;
  }
}
