part of mohrazium.app;

class EntryPoint {
  final Widget app;
  EntryPoint.to()
      : app = ModularApp(
          module: App(),
          child: TranslationProvider(child: const Mohrazium()),
        );
}

class Mohrazium extends StatefulWidget {
  const Mohrazium({Key? key}) : super(key: key);

  @override
  State<Mohrazium> createState() => _MohraziumState();
}

class _MohraziumState extends State<Mohrazium> {
  late final Function(BuildContext, Widget? child) botToastBuilder;
  final appController = Modular.get<AppController>();

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      mainContext.config = mainContext.config.clone(
        isSpyEnabled: true,
      );
      mainContext.spy((e) => logger.info(e.toString()));
    }

    Modular.setNavigatorKey(NavigatorHelper.maiNavigatorKey);

    Modular.setInitialRoute(Routing.routes().splash.path);

    LoggerService.setup();

    Modular.setObservers([
      NavigatorHelper.routeObserver,
      BotToastNavigatorObserver(),
    ]);

    botToastBuilder = BotToastInit();


    Modular.to.addListener(() =>
        logger.info("Route changed to ${NavigatorHelper.currentRoute()}"));

    appController.initState();
  }

  @override
  void didChangeDependencies() {
    appController.didChangeDependencies();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    appController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var translator = Translations.of(context);
    return MaterialApp(
        navigatorKey: NavigatorHelper.wrapNavigatorKey,
        home: ReactionBuilder(
          builder: (context) {
            return autorun((_) {
              if (appController.isLoading) {
                LoadingScreen.instance
                    .show(context: context, text: appController.loadingText);
              } else {
                LoadingScreen.instance.hide();
                print(" Hide Loading");
              }
            });
          },
          child: Observer(builder: (obsContext) {
            return MaterialApp.router(
              title: translator.appName,
              builder: (context, child) {
                return botToastBuilder(context, child);
              },
              locale: TranslationProvider.of(context).flutterLocale,
              supportedLocales: LocaleSettings.supportedLocales,
              localizationsDelegates: const [
                ...GlobalMaterialLocalizations.delegates,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              routeInformationParser: Modular.routeInformationParser,
              routerDelegate: Modular.routerDelegate,
              themeMode: appController.themeMode,
              theme: Themizer.light,
              darkTheme: Themizer.dark,
            );
          }),
        ));
  }
}
