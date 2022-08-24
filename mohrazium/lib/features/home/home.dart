library mohrazium.features.home;

import 'package:floy/floy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mohrazium/common/common.dart';
import 'package:mohrazium/localization/localization.dart';

part 'presentation/pages/home_page.dart';
part 'presentation/views/home_view_large.dart';

class Home extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
