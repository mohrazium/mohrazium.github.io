part of mohrazium.app;

class AppController extends _AppControllerStore with _$AppController {
  @override
  void didChangeDependencies() {
    logger.info("${this.runtimeType} changed dependencies.");
  }

  @override
  void dispose() {
    logger.info("${this.runtimeType} disposed.");
  }

  @override
  void initState() {
    logger.info("${this.runtimeType} init state.");
  }
}

abstract class _AppControllerStore extends Controller with Store {
  @observable
  ThemeMode themeMode = ThemeMode.light;
  @observable
  bool isLoading = false;
  @observable
  String loadingText = "";

  @action
  void switchTheme([ThemeMode? mode]) {
    themeMode = mode ??
        (themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }
}
