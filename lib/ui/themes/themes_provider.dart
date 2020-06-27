import 'package:flutter/material.dart';

darkTheme(context) {
  return ThemeData(
    fontFamily: 'GoogleSansRegular',
    primarySwatch: Colors.blue,
    primaryColor: Colors.black,
    accentColor: Colors.blue,
    disabledColor: Colors.grey,
    cardColor: Color(0xff1f2124),
    canvasColor: Colors.black,
    brightness: Brightness.dark,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: ColorScheme.dark(),
        buttonColor: Colors.blue,
        splashColor: Colors.black),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );
}

lightTheme(context) {
  return ThemeData(
    fontFamily: 'GoogleSansRegular',
    primarySwatch: Colors.blue,
    primaryColor: Colors.white,
    accentColor: Colors.blue,
    disabledColor: Colors.grey,
    cardColor: Colors.white,
    canvasColor: Colors.white,
    brightness: Brightness.light,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: ColorScheme.light(),
        buttonColor: Colors.blue,
        splashColor: Colors.white),
    appBarTheme: AppBarTheme(
      elevation: 2.5,
    ),
  );
}

class CustomTextStyles {
  var _fontStyle = TextStyle(
    color: Colors.black87,
    fontFamily: 'Sahel',
    fontFamilyFallback: ['Vazir'],
  );

  TextStyle h1() {
    return _fontStyle.copyWith(
      inherit: true,
      fontSize: 28,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle h2() {
    return h1().copyWith(
      inherit: true,
      fontSize: 24,
    );
  }

  TextStyle h3() {
    return h1().copyWith(
      inherit: true,
      fontSize: 20,
    );
  }

  TextStyle h4() {
    return h1().copyWith(
      inherit: true,
      fontSize: 16,
    );
  }

  TextStyle h5() {
    return h1().copyWith(
      inherit: true,
      fontSize: 12,
    );
  }

  TextStyle h6() {
    return h1().copyWith(
      inherit: true,
      fontSize: 8,
    );
  }
}

class ThemeSwitcher extends InheritedWidget {
  final _ThemeSwitcherWidgetState data;

  const ThemeSwitcher({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static _ThemeSwitcherWidgetState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ThemeSwitcher)
            as ThemeSwitcher)
        .data;
  }

  @override
  bool updateShouldNotify(ThemeSwitcher old) {
    return this != old;
  }
}

class ThemeSwitcherWidget extends StatefulWidget {
  final bool initialDarkModeOn; // this is the initial state of the variable
  final Widget
      child; // child to which this boolean variable should be propagated upon change. This will be our app in this case

  ThemeSwitcherWidget({Key key, this.initialDarkModeOn, this.child})
      : assert(initialDarkModeOn != null),
        assert(child != null),
        super(key: key);

  @override
  _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState();
}

class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  bool isDarkModeOn;

  void switchDarkMode() {
    //method used to toggle dark mode during the runtime of the app
    setState(() {
      isDarkModeOn = !isDarkModeOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    isDarkModeOn = isDarkModeOn ?? widget.initialDarkModeOn;
    return ThemeSwitcher(
      data: this,
      child: widget.child,
    );
  }
}
