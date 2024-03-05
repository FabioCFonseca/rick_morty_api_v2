import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/src/common/presentation/custom_app_bar.dart';

import 'package:rick_morty_flutter/src/features/character_details/presentation/ui/character_details_success.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: CharacterDetailsSuccess(),
      );
  }
}