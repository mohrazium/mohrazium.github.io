part of mohrazium.features.portfolio;

class AboutMeController extends _AboutMeControllerStore
    with _$AboutMeController {
  void openUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      debugPrint("Can not open url: $url");
    }
  }

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
    loadData();
  }
}

abstract class _AboutMeControllerStore extends Controller with Store {
  AppController appController = Modular.get<AppController>();
  AboutMeService aboutMeService = AboutMeService();
  @observable
  AboutMeModel model = AboutMeModel();
  @observable
  MessageException error = MessageException("");

  @action
  Future<void> loadData() async {
    Future.delayed(const Duration(milliseconds: 100)).then((v) async {
      appController.isLoading = true;
      model = await aboutMeService.getAboutMeData().then((value) {
        appController.isLoading = false;
        if (value != null) {
          return value;
        } else {
          return model;
        }
      }).catchError((error) {
        error = MessageException("خطایی رخ داده است");
      });
    });
  }
}
