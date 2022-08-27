part of mohrazium.config;

class Route {
  final ValueKey key;
  final String title;
  final String named;
  final String path;
  final dynamic args;
  const Route(
    this.path, {
    required this.key,
    required this.title,
    required this.named,
    this.args,
  });
}

class Routing {
  Routing.routes();
  Route get notFound => const Route(
        "/not-found/",
        key: ValueKey("not-found-key"),
        title: "404",
        named: "/not-found-page",
      );
  Route get root => const Route(
        "/",
        key: ValueKey("root-key"),
        title: "/",
        named: "/",
      );
  Route get splash => const Route(
        "/splash/",
        key: ValueKey("splash-key"),
        title: "splash",
        named: "/splash",
      );
  //! Home Routes
  Route get home => const Route(
        "/home/",
        key: ValueKey("home-key"),
        title: "Home",
        named: "/home",
      );
  //! About me Routes
  Route get aboutMe =>  Route(
        "${home.named}/about-me",
        key: const ValueKey("about-me-key"),
        title: "About Me",
        named: "/about-me",
      );
}
