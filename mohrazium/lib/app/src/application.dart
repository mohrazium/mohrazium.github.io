part of mohrazium.app;

class Application {
  Application.run() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(EntryPoint.to().app);
  }
}
