part of mohrazium.features.portfolio;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final homeController = Modular.get<HomeController>();
  @override
  void initState() {
    super.initState();
    homeController.initState();
    Modular.to.pushNamed(Routing.routes().aboutMe.path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (BuildContext context) {
        // ignore: always_specify_types
        var translator = Translations.of(context);
        return Container(
          color: Theme.of(context).colorScheme.background,
          child: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
                options: ParticleOptions(
                    spawnMaxRadius: 50,
                    particleCount: 20,
                    minOpacity: 0.1,
                    maxOpacity: 1.0,
                    spawnMaxSpeed: 10.0,
                    spawnMinSpeed: 5.0,
                    baseColor: Theme.of(context).colorScheme.secondary)),
            vsync: this,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(kPadding),
                      child: BlurryContainer(
                        blur: 5,
                        elevation: 0,
                        color: Theme.of(context).splashColor,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(kBorderRadius)),
                        height: MediaQuery.of(context).size.height * 0.90,
                        width: 1000,
                        child: const RouterOutlet(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );

    // return HomeView();
  }
}
