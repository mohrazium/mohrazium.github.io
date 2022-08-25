part of mohrazium.features.splash;

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then((s) {
      Modular.to.navigate(Routing.routes().home.path);
    });

    return const SafeArea(
      child: SplashView(),
    );

    // return HomeView();
  }
}
