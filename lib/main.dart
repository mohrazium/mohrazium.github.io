import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mohrazzr_ir/ui/pages/about_me.dart';
import 'package:mohrazzr_ir/ui/routes/routes.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'ui/app/main_app.dart';

void main() {
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"),
      debugShowCheckedModeBanner: false,
      title: 'تمرین فلاتر',
      theme: ThemeData.light(),
//lightTheme(context),
      initialRoute: '/',
      routes: {
        RouteConstants.ABOUT_ME: (context) => AboutMePage(),
      },
      home: MainApp(title: 'تمرین فلاتر'),
    );
  }
}
// MaterialApp(
//
//     );
