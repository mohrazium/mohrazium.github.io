part of common.components;

class SplashScreen extends StatefulWidget {
  /// Seconds to navigate after for time based navigation
  final int? seconds;

  /// switch to load only at startup of app not when get back to home page
  final bool isStartUp;

  /// App title, shown in the middle of screen in case of no image available
  final Text title;

  /// Page background color
  final Color? backgroundColor;

  /// Style for the loader text
  final TextStyle? styleTextUnderTheLoader;

  /// The page where you want to navigate if you have chosen time based navigation
  /// String or Widget
  final Widget? child;

  /// Main image size
  final double? photoSize;

  /// Triggered if the user clicks the screen
  final GestureTapCallback? onClick;

  /// Loader color
  final Color? loaderColor;

  /// Main image mainly used for logos and like that
  final Image? image;

  /// Loading text, default: 'Loading'
  final Text?loadingText;

  /// Padding for long Loading text, default: EdgeInsets.all(0)
  final EdgeInsets? loadingTextPadding;

  ///  Background image for the entire screen
  final ImageProvider? imageBackground;

  /// Background gradient for the entire screen
  final Gradient? gradientBackground;

  /// Whether to display a loader or not
  final bool useLoader;

  /// Custom page route if you have a custom transition you want to play
  final Route? pageRoute;

  /// RouteSettings name for pushing a route with custom name (if left out in MaterialApp route names) to navigator stack (Contribution by )
  final String? routeName;

  /// expects a function that returns a future, when this future is returned it will navigate
  /// Future<String> or Future<Widget>
  final Future<Object>? navigateAfterFuture;

  const SplashScreen.show(
      {this.seconds,
      this.isStartUp = true,
      required this.title,
      this.backgroundColor,
      this.styleTextUnderTheLoader,
      this.child,
      this.photoSize,
      this.onClick,
      this.loaderColor,
      this.image,
      this.loadingText,
      this.loadingTextPadding,
      this.imageBackground,
      this.gradientBackground,
      this.useLoader = true,
      this.pageRoute,
      this.routeName,
      this.navigateAfterFuture,
      Key? key})
      : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

late bool isShowFirst;

class _SplashScreenState extends State<SplashScreen> {
  Widget get _splashContent => Scaffold(
        body: InkWell(
          onTap: widget.onClick,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: widget.imageBackground != null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: widget.imageBackground!,
                        )
                      : null,
                  gradient: widget.gradientBackground,
                  color: widget.backgroundColor,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: widget.photoSize,
                          child: Hero(
                            tag: 'splashScreenImage',
                            child: Container(child: widget.image),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        widget.title
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        widget.useLoader
                            ? Center(
                                child: LoadingAnimationWidget.discreteCircle(
                                    color: Theme.of(context).colorScheme.primary,
                                    secondRingColor: Theme.of(context).colorScheme.secondary,
                                    thirdRingColor: widget.loaderColor ??
                                        Theme.of(context).colorScheme.primary.withAlpha(50),
                                    size: 65))
                            : Container(),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        Padding(
                          padding: widget.loadingTextPadding?? const EdgeInsets.all(15.0),
                          child: widget.loadingText,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (widget.isStartUp) {
        isShowFirst = true;
        widget.navigateAfterFuture?.then((s) => setState(() {
              isShowFirst = false;
            }));
      } else {
        isShowFirst = false;
      }
    });

    return Builder(builder: (context) {
      return AnimatedCrossFade(
        firstChild: _splashContent,
        secondChild: widget.child ?? Container(),
        crossFadeState: isShowFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 1000),
        firstCurve: Curves.easeInCubic,
        secondCurve: Curves.easeOutCubic,
        layoutBuilder: (Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey) {
          return Stack(
            clipBehavior: Clip.hardEdge,
            children: <Widget>[
              Positioned(
                key: bottomChildKey,
                child: bottomChild,
              ),
              Positioned(
                key: topChildKey,
                child: topChild,
              ),
            ],
          );
        },
      );
    });
  }
}
