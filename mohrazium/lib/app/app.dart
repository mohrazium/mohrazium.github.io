library mohrazium.app;

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mohrazium/common/common.dart';

import 'package:mohrazium/config/config.dart'
    show Injector, LoggerService, Routing, logger;
import 'package:mohrazium/constants/constants.dart';
import 'package:mohrazium/features/features.dart' show Home, Splash;
import 'package:mohrazium/localization/localization.dart'
    show LocaleSettings, TranslationProvider, Translations;

part 'src/navigator_helper.dart';
part 'src/application.dart';
part 'src/entry_point.dart';
part 'src/app_controller.dart';
part 'app.g.dart';

class App extends Module {
  @override
  List<Bind<Object>> get binds => [
        ...Injector.inject().appBinds,
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Routing.routes().splash.path,
          transition: TransitionType.fadeIn,
          duration: kAnimationDuration,
          module: Splash(),
        ),
        ModuleRoute(
          Routing.routes().home.path,
          module: Home(),
          transition: TransitionType.fadeIn,
          duration: kAnimationDuration,
        ),
        WildcardRoute(
          child: (context, args) => const NotFoundScreen(),
          transition: TransitionType.fadeIn,
          duration: kAnimationDuration,
        ),
      ];
}
