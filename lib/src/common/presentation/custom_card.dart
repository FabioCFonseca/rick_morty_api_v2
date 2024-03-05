// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/src/common/consts/spacers.dart';
import 'package:rick_morty_flutter/src/features/character_details/presentation/details_page.dart';

import 'package:rick_morty_flutter/src/features/favorites_list/domain/favorites_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.character});

  final FavoritesModel character;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(35),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: CachedNetworkImage(
                imageUrl: character.image,
                width: 150,
                height: 150,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
            ),
            AppSizes.small(),
            Text(
              character.name,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            AppSizes.large(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailsPage(),
                    ),
                  ),
                  child: Text(
                    'Details',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('Toggle');
                  },
                  child: Icon(
                    Icons.favorite_outline,
                    color: Color(0xffA333C8),
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
