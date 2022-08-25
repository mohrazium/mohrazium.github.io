part of common.components;

class Themizer {
  Themizer._();

  static ThemeData get theme => ThemeData(colorSchemeSeed: Colorize.seed);
  static ThemeData get light => LightTheme.theme;
  static ThemeData get dark => DarkTheme.theme;
}
