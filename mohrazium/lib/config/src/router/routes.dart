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
//! Accounts Routes
  Route get accounts => const Route(
        "/accounts/",
        key: ValueKey("accounts-key"),
        title: "Accounts",
        named: "/accounts",
      );
  Route get login =>  Route(
        "${accounts.named}/login",
        key: const ValueKey("login-key"),
        title: "Login",
        named: "/login",
      );
  Route get signup =>  Route(
        "${accounts.named}/signup",
        key:const ValueKey("signup-key"),
        title: "Sign up",
        named: "/signup",
      );
  Route get passwordReset =>  Route(
        "${accounts.named}/password-reset",
        key:const ValueKey("password-reset-key"),
        title: "Password Reset",
        named: "/password-reset",
      );
//! Home Routes
  Route get home => const Route(
        "/home/",
        key: ValueKey("home-key"),
        title: "Home",
        named: "/home",
      );
}
