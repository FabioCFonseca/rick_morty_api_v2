import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_flutter/src/common/presentation/loading.dart';
import 'package:rick_morty_flutter/src/features/characters_list/presentation/ui/characters_success.dart';
import 'package:rick_morty_flutter/src/features/characters_list/provider/character_list_provider.dart';

class CharactersListPage extends StatelessWidget {
  const CharactersListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterListProvider>(
      builder: (context, provider, child) {
        Widget statusResult;
        switch (provider.providerStatus) {
          case CharacterListProviderState.loading:
            statusResult = const LoadingIndicator();
          case CharacterListProviderState.success:
            statusResult = const CharactersSuccess();
          default:
            statusResult = Center(child: Text(provider.appError.errorMessage));
            break;
        }
        return statusResult;        
      },
    );
  }
}