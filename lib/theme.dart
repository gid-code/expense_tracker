import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278217317),
      surfaceTint: Color(4278217317),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288541163),
      onPrimaryContainer: Color(4278198302),
      secondary: Color(4283065185),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291619045),
      onSecondaryContainer: Color(4278525726),
      tertiary: Color(4282933371),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4291880191),
      onTertiaryContainer: Color(4278197556),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294245369),
      onSurface: Color(4279639324),
      onSurfaceVariant: Color(4282337607),
      outline: Color(4285495672),
      outlineVariant: Color(4290693575),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020977),
      inversePrimary: Color(4286698958),
      primaryFixed: Color(4288541163),
      onPrimaryFixed: Color(4278198302),
      primaryFixedDim: Color(4286698958),
      onPrimaryFixedVariant: Color(4278210636),
      secondaryFixed: Color(4291619045),
      onSecondaryFixed: Color(4278525726),
      secondaryFixedDim: Color(4289776841),
      onSecondaryFixedVariant: Color(4281486153),
      tertiaryFixed: Color(4291880191),
      onTertiaryFixed: Color(4278197556),
      tertiaryFixedDim: Color(4289776103),
      onTertiaryFixedVariant: Color(4281354594),
      surfaceDim: Color(4292205530),
      surfaceBright: Color(4294245369),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916147),
      surfaceContainer: Color(4293521389),
      surfaceContainerHigh: Color(4293126632),
      surfaceContainerHighest: Color(4292732130),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  // static ColorScheme lightMediumContrastScheme() {
  //   return const ColorScheme(
  //     brightness: Brightness.light,
  //     primary: Color(4278209352),
  //     surfaceTint: Color(4278217317),
  //     onPrimary: Color(4294967295),
  //     primaryContainer: Color(4280648060),
  //     onPrimaryContainer: Color(4294967295),
  //     secondary: Color(4281222981),
  //     onSecondary: Color(4294967295),
  //     secondaryContainer: Color(4284512887),
  //     onSecondaryContainer: Color(4294967295),
  //     tertiary: Color(4281091422),
  //     onTertiary: Color(4294967295),
  //     tertiaryContainer: Color(4284446610),
  //     onTertiaryContainer: Color(4294967295),
  //     error: Color(4287365129),
  //     onError: Color(4294967295),
  //     errorContainer: Color(4292490286),
  //     onErrorContainer: Color(4294967295),
  //     surface: Color(4294245369),
  //     onSurface: Color(4279639324),
  //     onSurfaceVariant: Color(4282074436),
  //     outline: Color(4283916640),
  //     outlineVariant: Color(4285758843),
  //     shadow: Color(4278190080),
  //     scrim: Color(4278190080),
  //     inverseSurface: Color(4281020977),
  //     inversePrimary: Color(4286698958),
  //     primaryFixed: Color(4280648060),
  //     onPrimaryFixed: Color(4294967295),
  //     primaryFixedDim: Color(4278216547),
  //     onPrimaryFixedVariant: Color(4294967295),
  //     secondaryFixed: Color(4284512887),
  //     onSecondaryFixed: Color(4294967295),
  //     secondaryFixedDim: Color(4282868062),
  //     onSecondaryFixedVariant: Color(4294967295),
  //     tertiaryFixed: Color(4284446610),
  //     onTertiaryFixed: Color(4294967295),
  //     tertiaryFixedDim: Color(4282801784),
  //     onTertiaryFixedVariant: Color(4294967295),
  //     surfaceDim: Color(4292205530),
  //     surfaceBright: Color(4294245369),
  //     surfaceContainerLowest: Color(4294967295),
  //     surfaceContainerLow: Color(4293916147),
  //     surfaceContainer: Color(4293521389),
  //     surfaceContainerHigh: Color(4293126632),
  //     surfaceContainerHighest: Color(4292732130),
  //   );
  // }

  // ThemeData lightMediumContrast() {
  //   return theme(lightMediumContrastScheme());
  // }

  // static ColorScheme lightHighContrastScheme() {
  //   return const ColorScheme(
  //     brightness: Brightness.light,
  //     primary: Color(4278200101),
  //     surfaceTint: Color(4278217317),
  //     onPrimary: Color(4294967295),
  //     primaryContainer: Color(4278209352),
  //     onPrimaryContainer: Color(4294967295),
  //     secondary: Color(4278986276),
  //     onSecondary: Color(4294967295),
  //     secondaryContainer: Color(4281222981),
  //     onSecondaryContainer: Color(4294967295),
  //     tertiary: Color(4278658107),
  //     onTertiary: Color(4294967295),
  //     tertiaryContainer: Color(4281091422),
  //     onTertiaryContainer: Color(4294967295),
  //     error: Color(4283301890),
  //     onError: Color(4294967295),
  //     errorContainer: Color(4287365129),
  //     onErrorContainer: Color(4294967295),
  //     surface: Color(4294245369),
  //     onSurface: Color(4278190080),
  //     onSurfaceVariant: Color(4280034853),
  //     outline: Color(4282074436),
  //     outlineVariant: Color(4282074436),
  //     shadow: Color(4278190080),
  //     scrim: Color(4278190080),
  //     inverseSurface: Color(4281020977),
  //     inversePrimary: Color(4289133556),
  //     primaryFixed: Color(4278209352),
  //     onPrimaryFixed: Color(4294967295),
  //     primaryFixedDim: Color(4278203184),
  //     onPrimaryFixedVariant: Color(4294967295),
  //     secondaryFixed: Color(4281222981),
  //     onSecondaryFixed: Color(4294967295),
  //     secondaryFixedDim: Color(4279775535),
  //     onSecondaryFixedVariant: Color(4294967295),
  //     tertiaryFixed: Color(4281091422),
  //     onTertiaryFixed: Color(4294967295),
  //     tertiaryFixedDim: Color(4279512646),
  //     onTertiaryFixedVariant: Color(4294967295),
  //     surfaceDim: Color(4292205530),
  //     surfaceBright: Color(4294245369),
  //     surfaceContainerLowest: Color(4294967295),
  //     surfaceContainerLow: Color(4293916147),
  //     surfaceContainer: Color(4293521389),
  //     surfaceContainerHigh: Color(4293126632),
  //     surfaceContainerHighest: Color(4292732130),
  //   );
  // }

  // ThemeData lightHighContrast() {
  //   return theme(lightHighContrastScheme());
  // }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4286698958),
      surfaceTint: Color(4286698958),
      onPrimary: Color(4278204212),
      primaryContainer: Color(4278210636),
      onPrimaryContainer: Color(4288541163),
      secondary: Color(4289776841),
      onSecondary: Color(4279973171),
      secondaryContainer: Color(4281486153),
      onSecondaryContainer: Color(4291619045),
      tertiary: Color(4289776103),
      onTertiary: Color(4279841354),
      tertiaryContainer: Color(4281354594),
      onTertiaryContainer: Color(4291880191),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279112980),
      onSurface: Color(4292732130),
      onSurfaceVariant: Color(4290693575),
      outline: Color(4287140753),
      outlineVariant: Color(4282337607),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292732130),
      inversePrimary: Color(4278217317),
      primaryFixed: Color(4288541163),
      onPrimaryFixed: Color(4278198302),
      primaryFixedDim: Color(4286698958),
      onPrimaryFixedVariant: Color(4278210636),
      secondaryFixed: Color(4291619045),
      onSecondaryFixed: Color(4278525726),
      secondaryFixedDim: Color(4289776841),
      onSecondaryFixedVariant: Color(4281486153),
      tertiaryFixed: Color(4291880191),
      onTertiaryFixed: Color(4278197556),
      tertiaryFixedDim: Color(4289776103),
      onTertiaryFixedVariant: Color(4281354594),
      surfaceDim: Color(4279112980),
      surfaceBright: Color(4281612858),
      surfaceContainerLowest: Color(4278783759),
      surfaceContainerLow: Color(4279639324),
      surfaceContainer: Color(4279902496),
      surfaceContainerHigh: Color(4280625962),
      surfaceContainerHighest: Color(4281284149),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  // static ColorScheme darkMediumContrastScheme() {
  //   return const ColorScheme(
  //     brightness: Brightness.dark,
  //     primary: Color(4286962131),
  //     surfaceTint: Color(4286698958),
  //     onPrimary: Color(4278196761),
  //     primaryContainer: Color(4282949272),
  //     onPrimaryContainer: Color(4278190080),
  //     secondary: Color(4290105549),
  //     onSecondary: Color(4278262296),
  //     secondaryContainer: Color(4286289555),
  //     onSecondaryContainer: Color(4278190080),
  //     tertiary: Color(4290039276),
  //     onTertiary: Color(4278196012),
  //     tertiaryContainer: Color(4286288815),
  //     onTertiaryContainer: Color(4278190080),
  //     error: Color(4294949553),
  //     onError: Color(4281794561),
  //     errorContainer: Color(4294923337),
  //     onErrorContainer: Color(4278190080),
  //     surface: Color(4279112980),
  //     onSurface: Color(4294376698),
  //     onSurfaceVariant: Color(4290956747),
  //     outline: Color(4288390563),
  //     outlineVariant: Color(4286285188),
  //     shadow: Color(4278190080),
  //     scrim: Color(4278190080),
  //     inverseSurface: Color(4292732130),
  //     inversePrimary: Color(4278210893),
  //     primaryFixed: Color(4288541163),
  //     onPrimaryFixed: Color(4278195219),
  //     primaryFixedDim: Color(4286698958),
  //     onPrimaryFixedVariant: Color(4278205754),
  //     secondaryFixed: Color(4291619045),
  //     onSecondaryFixed: Color(4278195219),
  //     secondaryFixedDim: Color(4289776841),
  //     onSecondaryFixedVariant: Color(4280367672),
  //     tertiaryFixed: Color(4291880191),
  //     onTertiaryFixed: Color(4278194724),
  //     tertiaryFixedDim: Color(4289776103),
  //     onTertiaryFixedVariant: Color(4280236112),
  //     surfaceDim: Color(4279112980),
  //     surfaceBright: Color(4281612858),
  //     surfaceContainerLowest: Color(4278783759),
  //     surfaceContainerLow: Color(4279639324),
  //     surfaceContainer: Color(4279902496),
  //     surfaceContainerHigh: Color(4280625962),
  //     surfaceContainerHighest: Color(4281284149),
  //   );
  // }

  // ThemeData darkMediumContrast() {
  //   return theme(darkMediumContrastScheme());
  // }

  // static ColorScheme darkHighContrastScheme() {
  //   return const ColorScheme(
  //     brightness: Brightness.dark,
  //     primary: Color(4293591036),
  //     surfaceTint: Color(4286698958),
  //     onPrimary: Color(4278190080),
  //     primaryContainer: Color(4286962131),
  //     onPrimaryContainer: Color(4278190080),
  //     secondary: Color(4293591036),
  //     onSecondary: Color(4278190080),
  //     secondaryContainer: Color(4290105549),
  //     onSecondaryContainer: Color(4278190080),
  //     tertiary: Color(4294638335),
  //     onTertiary: Color(4278190080),
  //     tertiaryContainer: Color(4290039276),
  //     onTertiaryContainer: Color(4278190080),
  //     error: Color(4294965753),
  //     onError: Color(4278190080),
  //     errorContainer: Color(4294949553),
  //     onErrorContainer: Color(4278190080),
  //     surface: Color(4279112980),
  //     onSurface: Color(4294967295),
  //     onSurfaceVariant: Color(4294180347),
  //     outline: Color(4290956747),
  //     outlineVariant: Color(4290956747),
  //     shadow: Color(4278190080),
  //     scrim: Color(4278190080),
  //     inverseSurface: Color(4292732130),
  //     inversePrimary: Color(4278202414),
  //     primaryFixed: Color(4288804591),
  //     onPrimaryFixed: Color(4278190080),
  //     primaryFixedDim: Color(4286962131),
  //     onPrimaryFixedVariant: Color(4278196761),
  //     secondaryFixed: Color(4291882473),
  //     onSecondaryFixed: Color(4278190080),
  //     secondaryFixedDim: Color(4290105549),
  //     onSecondaryFixedVariant: Color(4278262296),
  //     tertiaryFixed: Color(4292339967),
  //     onTertiaryFixed: Color(4278190080),
  //     tertiaryFixedDim: Color(4290039276),
  //     onTertiaryFixedVariant: Color(4278196012),
  //     surfaceDim: Color(4279112980),
  //     surfaceBright: Color(4281612858),
  //     surfaceContainerLowest: Color(4278783759),
  //     surfaceContainerLow: Color(4279639324),
  //     surfaceContainer: Color(4279902496),
  //     surfaceContainerHigh: Color(4280625962),
  //     surfaceContainerHighest: Color(4281284149),
  //   );
  // }

  // ThemeData darkHighContrast() {
  //   return theme(darkHighContrastScheme());
  // }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
