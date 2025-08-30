import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/src/common/env.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      forceMaterialTransparency: true,
      centerTitle: true,
      title: Text(Env.flavor.appTitle),
    );
  }
}