library mohrazium.features.splash;

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mohrazium/config/config.dart';

import '../../common/common.dart';

part 'pages/splash_page.dart';
part 'views/splash_view.dart';

class Splash extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
      ];
}
