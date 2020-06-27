import 'package:flutter/material.dart';
import 'package:mohrazzr_ir/ui/app/weblog_app.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainApp extends StatefulWidget {
  MainApp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(tablet: 600, desktop: 950, watch: 300),
      mobile: WeblogApp(),
      tablet: WeblogApp(),
      desktop: WeblogApp(),
      watch: Container(color: Colors.purple),
    ));
  }
}
