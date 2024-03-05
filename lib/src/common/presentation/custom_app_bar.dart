import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    const isWeb = kIsWeb;

    return AppBar(
      toolbarHeight: 80,
      forceMaterialTransparency: true,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: isWeb
            ? Image.asset(
                'assets/logo.png',
                height: 70,
              )
            : CachedNetworkImage(
                imageUrl: 'https://www.vhv.rs/dpng/f/430-4305710_rick-png.png',
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 70,
              ),
      ),
    );
  }
}