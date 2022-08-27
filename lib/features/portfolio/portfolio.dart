library mohrazium.features.portfolio;

import 'dart:convert';

import 'package:animated_background/animated_background.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:floy/floy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:mohrazium/app/app.dart';
import 'package:mohrazium/common/common.dart';
import 'package:mohrazium/config/config.dart';
import 'package:mohrazium/constants/constants.dart';
import 'package:mohrazium/exceptions/exceptions.dart';
import 'package:mohrazium/features/features.dart';
import 'package:mohrazium/localization/localization.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

part 'pages/home_page.dart';
part 'views/home_view_large.dart';
part 'views/about_me_view_large.dart';
part 'controllers/home_controller.dart';
part 'controllers/about_me_controller.dart';
part 'pages/about_me_page.dart';
part 'models/about_me_model.dart';
part 'services/about_me_service.dart';
part 'portfolio.g.dart';

class Portfolio extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage(), children: [
          ChildRoute(Routing.routes().aboutMe.named,
              child: (context, args) => const AboutMePage())
        ]),
      ];
}
