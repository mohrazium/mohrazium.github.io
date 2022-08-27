part of mohrazium.config;

class Injector {
  Injector.inject();

  List<Bind<Object>> get appBinds => [
        // Bind.lazySingleton<AboutMeService>((i) => i()),
        Bind.singleton<AppController>((i) => AppController(),
            onDispose: (controller) => controller.dispose()),
        Bind.singleton<HomeController>((i) => HomeController(),
            onDispose: (controller) => controller.dispose()),
        Bind.singleton<AboutMeController>((i) => AboutMeController(),
            onDispose: (controller) => controller.dispose()),
      ];
}
