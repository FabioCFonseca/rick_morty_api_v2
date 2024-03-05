// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

class AppSizes {
  static const double spacerSmall = 8.0;
  static const double spacerMedium = 16.0;
  static const double spacerLarge = 25.0;

  static SizedBox small() {
    return const SizedBox(height: spacerSmall, width: spacerSmall);
  }

  static SizedBox medium() {
    return const SizedBox(height: spacerMedium, width: spacerMedium);
  }

  static SizedBox large() {
    return const SizedBox(height: spacerLarge, width: spacerLarge);
  }
}