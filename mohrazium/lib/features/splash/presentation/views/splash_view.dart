part of mohrazium.features.splash;

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreen.show(
      title: Text("title"),
      loadingText: Text("loading"),
    );
  }
}
