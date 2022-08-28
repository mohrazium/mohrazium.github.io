part of mohrazium.features.portfolio;

class AboutMePage extends StatefulWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  final aboutMeController = Modular.get<AboutMeController>();
  @override
  void initState() {
    super.initState();
    aboutMeController.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloyResponsive(
      extraSmallPage: AboutMeViewMedium(controller: aboutMeController),
      smallPage: AboutMeViewMedium(controller: aboutMeController),
      mediumSmallPage: AboutMeViewMedium(controller: aboutMeController),
      mediumPage: AboutMeViewLarge(controller: aboutMeController),
      largePage: AboutMeViewLarge(controller: aboutMeController),
    );
  }
}
