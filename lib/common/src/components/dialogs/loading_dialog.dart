part of common.components;

class LoadingScreen {
  LoadingScreen._sharedInstance();

  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  static LoadingScreen get instance => _shared;

  _LoadingScreenController? controller;

  void show({
    required BuildContext context,
    required String text,
  }) {
    if (controller?.update(text) ?? false) {
      return;
    } else {
      controller = _showOverlay(
        context: context,
        text: text,
      );
    }
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  _LoadingScreenController _showOverlay({
    required BuildContext context,
    required String text,
  }) {
    final stText = StreamController<String>();
    stText.add(text);

    final state = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final overlay = OverlayEntry(
      builder: (context) {
        final oSize = MediaQuery.of(context).size;
        final double maxWidth = oSize.width >= 250 ? 150 : oSize.width * 0.8;
        final double maxHeight = oSize.height >= 250 ? 150 : oSize.height * 0.8;
        return Material(
          color: Theme.of(context).colorScheme.shadow.withAlpha(150),
          child: Center(
            child: GroupBox(
              width: maxWidth,
              height: maxHeight,
              padding: const EdgeInsets.all(kPadding),
              margin: const EdgeInsets.all(kMargin),
              color: Theme.of(context).cardColor,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: kSpacing),
                    LoadingAnimationWidget.discreteCircle(
                        color: Theme.of(context).colorScheme.primary,
                        secondRingColor:
                            Theme.of(context).colorScheme.secondary,
                        thirdRingColor: Theme.of(context).colorScheme.tertiary,
                        size: 50),
                    const SizedBox(height: kSpacing),
                    StreamBuilder(
                      stream: stText.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data as String,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    state?.insert(overlay);

    return _LoadingScreenController(
      close: () {
        stText.close();
        overlay.remove();
        return true;
      },
      update: (text) {
        stText.add(text);
        return true;
      },
    );
  }
}

typedef _CloseLoadingScreen = bool Function();
typedef _UpdateLoadingScreen = bool Function(String text);

@immutable
class _LoadingScreenController {
  final _CloseLoadingScreen close;
  final _UpdateLoadingScreen update;

  const _LoadingScreenController({
    required this.close,
    required this.update,
  });
}
