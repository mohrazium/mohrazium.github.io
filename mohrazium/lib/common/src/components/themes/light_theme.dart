part of common.components;

class LightTheme {
  static const kBorderWith = 1.2;
  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        fontFamily: kDefaultFont,
        brightness: Brightness.light,
        colorScheme: Colorize.lightColorScheme,
        iconTheme: iconTheme,
        appBarTheme: appBarTheme,
        textTheme: textTheme,
        elevatedButtonTheme: elevatedButtonThemeData,
        inputDecorationTheme: inputDecorationTheme,
        checkboxTheme: checkboxTheme,
      );

  static TextStyle get textStyle => const TextStyle(fontFamily: kDefaultFont);

  static final appBarTheme = AppBarTheme(
    color: Colorize.lightColorScheme.background,
    elevation: 5.0,
    shadowColor: Colorize.lightColorScheme.shadow,
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  );

  static final iconTheme =
      IconThemeData(color: Colorize.lightColorScheme.onBackground);

  static TextTheme get textTheme => TextTheme(
      headline1: Fonts.headline1(),
      headline2: Fonts.headline2(),
      headline3: Fonts.headline3(),
      headline4: Fonts.headline4(),
      headline5: Fonts.headline5(),
      headline6: Fonts.headline6(),
      bodyText1: Fonts.body1(),
      bodyText2: Fonts.body2(),
      subtitle1: Fonts.subtitle1(),
      subtitle2: Fonts.subtitle2(),
      caption: Fonts.caption());

  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        contentPadding: const EdgeInsets.all(kPadding / 3),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: kBorderWith, color: Colorize.lightColorScheme.secondary),
          borderRadius: const BorderRadius.all(
            Radius.circular(kBorderRadius),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: kBorderWith, color: Colorize.lightColorScheme.error),
          borderRadius: const BorderRadius.all(
            Radius.circular(kBorderRadius),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              width: kBorderWith, color: Colorize.lightColorScheme.primary),
          borderRadius: const BorderRadius.all(
            Radius.circular(kBorderRadius),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: kBorderWith, color: Colorize.lightColorScheme.primary),
          borderRadius: const BorderRadius.all(
            Radius.circular(kBorderRadius),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: kBorderWith, color: Colorize.lightColorScheme.error),
          borderRadius: const BorderRadius.all(
            Radius.circular(kBorderRadius),
          ),
        ),
        fillColor: Colorize.lightColorScheme.background,
        filled: true,
        errorStyle: const TextStyle(
          height: 0,
        ),
        labelStyle: TextStyle(
          color: Colorize.lightColorScheme.primary,
        ),
        counterStyle: const TextStyle(
          color: Colors.transparent,
          fontSize: 4.0,
        ),
        focusColor: Colorize.lightColorScheme.secondary,
      );

  static ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colorize.lightColorScheme.primary,
          onPrimary: Colorize.lightColorScheme.onPrimary,
          onSurface: Colorize.lightColorScheme.onSurface,
          shadowColor: Colorize.lightColorScheme.shadow,
          surfaceTintColor: Colorize.lightColorScheme.surfaceTint,
          elevation: 0.0,
          fixedSize: const Size(135, 40),
          animationDuration: kAnimationDuration,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
        ),
      );

  static CheckboxThemeData get checkboxTheme => CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colorize.lightColorScheme.primary),
        checkColor:
            MaterialStateProperty.all(Colorize.lightColorScheme.onPrimary),
        side: BorderSide(
            width: kBorderWith,
            color: Colorize.lightColorScheme.secondary,
            style: BorderStyle.solid),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(kBorderRadius))), // Rounded Checkbox
      );
}
