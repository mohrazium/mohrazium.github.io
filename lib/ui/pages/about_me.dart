import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mohrazzr_ir/ui/mo_widgets/mo_widgets.dart';
import 'package:mohrazzr_ir/ui/widgets/about_me_widget.dart';
import 'package:mohrazzr_ir/ui/widgets/my_profile_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(tablet: 600, desktop: 950, watch: 300),
      mobile: TabletView(),
      tablet: TabletView(),
      desktop: DesktopView(),
      watch: DesktopView(),
    );
  }
}

class TabletView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(50.0),
      shrinkWrap: true,
      children: [
        Container(height: 650, child: MyProfileWidget()),
        Container(height: 1200, child: AboutMeWidget()),
      ],
    );
  }
}

class DesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50.0),
      child: Row(
        children: [
          MyProfileWidget(),
          Expanded(flex: 6, child: AboutMeWidget())
        ],
      ),
    );
  }
}
