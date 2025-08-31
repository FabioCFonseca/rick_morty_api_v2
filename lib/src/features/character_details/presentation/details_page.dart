import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_flutter/src/common/presentation/custom_app_bar.dart';

import 'package:rick_morty_flutter/src/common/presentation/loading.dart';
import 'package:rick_morty_flutter/src/features/character_details/infrastructure/character_details_repository.dart';
import 'package:rick_morty_flutter/src/features/character_details/presentation/ui/character_details_success.dart';
import 'package:rick_morty_flutter/src/features/character_details/provider/character_details_provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.selectedCharacter});

  final int selectedCharacter;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CharacterDetailsProvider>(
      create: (context) => CharacterDetailsProvider(
        selectedCharacter: selectedCharacter,
        repository: CharactersDetailsRepository(),
      )..controllerStart(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Consumer<CharacterDetailsProvider>(
          builder: (context, characterDetailsProvider, child) {
            Widget statusResult;
            switch (characterDetailsProvider.providerStatus) {
              case CharacterDetailsProviderState.loading:
                statusResult = const LoadingIndicator();
              case CharacterDetailsProviderState.success:
                statusResult = const CharacterDetailsSuccess();
              default:
                statusResult = Center(
                  child: Text(characterDetailsProvider.appError.errorMessage),
                );
                break;
            }
            return statusResult;
          },
        ),
      ),
    );
  }
}