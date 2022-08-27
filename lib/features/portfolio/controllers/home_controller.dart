part of mohrazium.features.portfolio;

class HomeController extends _HomeControllerStore with _$HomeController {
  @override
  void didChangeDependencies() {
    debugPrint("${this.runtimeType} changed dependencies.");
  }

  @override
  void dispose() {
    debugPrint("${this.runtimeType} disposed.");
  }

  @override
  void initState() {
    debugPrint("${this.runtimeType} init state.");
  }
}

abstract class _HomeControllerStore extends Controller with Store {
  @observable
  bool inAboutMePage = false;

  @action
  void switchToAboutMePage() {
    inAboutMePage = true;
  }
}
