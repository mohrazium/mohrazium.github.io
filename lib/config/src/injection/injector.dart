part of mohrazium.config;

class Injector {
  Injector.inject();

  List<Bind<Object>> get appBinds => [
        Bind.singleton<AppController>((i) => AppController(),
            onDispose: (controller) => controller.dispose()),
      ];
}
