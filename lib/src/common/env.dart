// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: do_not_use_environment

abstract class Env {
  static final Flavor flavor = Flavor.fromString(
    const String.fromEnvironment('FLAVOR'),
  );
}

enum Flavor {
  dev('DEV'),
  prod('PROD');

  const Flavor(this.code);

  factory Flavor.fromString(String code) => switch (code.toUpperCase()) {
        'DEV' => Flavor.dev,
        'PROD' => Flavor.prod,
        _ => Flavor.dev,
      };

  final String code;

  String get appTitle => switch (this) {
        Flavor.dev => 'D E V',
        Flavor.prod => 'P R O D',
      };
}
