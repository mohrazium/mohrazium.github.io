part of mohrazium.features.portfolio;

class AboutMeViewLarge extends StatelessWidget {
  final AboutMeController controller;
  const AboutMeViewLarge({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var translator = Translations.of(context);
      return Observer(builder: (context) {
        Widget content = Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Column(
                    children: [
                      BlurryContainer(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(kBorderRadius)),
                          height: 270,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withAlpha(50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 250),
                              Column(
                                children: [
                                  const SizedBox(height: kSpacing),
                                  RichLable(
                                    text: controller.model.fullName,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .headline3
                                            ?.fontSize),
                                  ),
                                  const SizedBox(height: kSpacing),
                                  RichLable(
                                    text: controller.model.headline,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.fontSize),
                                  ),
                                  const SizedBox(height: kSpacing),
                                  RichLable(
                                    text:
                                        "علاقمند به ${controller.model.intrestedIn}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize),
                                  ),
                                  const SizedBox(height: kSpacing),
                                  Material(
                                    borderRadius:
                                        BorderRadius.circular(kBorderRadius),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background
                                        .withAlpha(150),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          kPadding, 0, kPadding, 0),
                                      child: Row(
                                        children: [
                                          IconButton(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              onPressed: () {
                                                controller.openUrl(controller
                                                        .model.linktoTwitter ??
                                                    "");
                                              },
                                              icon: const FaIcon(
                                                  FontAwesomeIcons.twitter)),
                                          IconButton(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              onPressed: () {
                                                controller.openUrl(controller
                                                        .model.linktoTelegram ??
                                                    "");
                                              },
                                              icon: const FaIcon(
                                                  FontAwesomeIcons.telegram)),
                                          IconButton(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              onPressed: () {
                                                controller.openUrl(controller
                                                        .model
                                                        .linktoInstagram ??
                                                    "");
                                              },
                                              icon: const FaIcon(
                                                  FontAwesomeIcons.instagram)),
                                          IconButton(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              onPressed: () {
                                                controller.openUrl(controller
                                                        .model.linktoLinkedin ??
                                                    "");
                                              },
                                              icon: const FaIcon(
                                                  FontAwesomeIcons.linkedin)),
                                          IconButton(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              onPressed: () {
                                                controller.openUrl(controller
                                                        .model.linktoGithub ??
                                                    "");
                                              },
                                              icon: const FaIcon(
                                                  FontAwesomeIcons.github)),
                                          IconButton(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              onPressed: () {
                                                controller.openUrl(controller
                                                        .model.linktoGitlab ??
                                                    "");
                                              },
                                              icon: const FaIcon(
                                                  FontAwesomeIcons.gitlab)),
                                          IconButton(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              onPressed: () {
                                                controller.openUrl(controller
                                                        .model
                                                        .linktoBitbucket ??
                                                    "");
                                              },
                                              icon: const FaIcon(
                                                  FontAwesomeIcons.bitbucket)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      const SizedBox(height: 42),
                    ],
                  ),
                  Positioned(
                    right: 20,
                    bottom: 0,
                    child: SizedBox(
                      height: 250,
                      width: 250,
                      child: CircularProfileAvatar(
                        animateFromOldImageOnUrlChange: true,
                        controller.model.profileUrl ?? "",
                        radius: kBorderRadius,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        borderWidth: 5,
                        borderColor: Theme.of(context).colorScheme.primary,
                        elevation: 5.0,
                        cacheImage: false,
                        showInitialTextAbovePicture: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.all(kPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: kSpacing),
                                RichLable(
                                  text: "درباره ی من",
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.fontSize),
                                ),
                                const SizedBox(height: kSpacing),
                                RichLable(
                                  text: controller.model.aboutMe,
                                  style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.fontSize),
                                ),
                                const SizedBox(height: kSpacing),
                                ElevatedButton(
                                    onPressed: () {
                                      controller.openUrl(Urls.resume);
                                    },
                                    child: RichLable(text: "دریافت رزومه"))
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  RichLable(
                                    text: "وضیعت",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize),
                                  ),
                                  const SizedBox(height: kSpacing),
                                  RichLable(
                                    text: "محل سکونت",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize),
                                  ),
                                  const SizedBox(height: kSpacing),
                                  RichLable(
                                    text: "آدرس",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize),
                                  ),
                                  const SizedBox(height: kSpacing),
                                  RichLable(
                                    text: "ایمیل",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize),
                                  ),
                                  const SizedBox(height: kSpacing),
                                  RichLable(
                                    text: "سن",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: kSpacing,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichLable(
                                    text: controller.model.status,
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize),
                                  ),
                                  const SizedBox(height: kSpacing),
                                  RichLable(
                                    text: controller.model.city,
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize),
                                  ),
                                  const SizedBox(height: kSpacing),
                                  RichLable(
                                    text: controller.model.address,
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize),
                                  ),
                                  const SizedBox(height: kSpacing),
                                  RichLable(
                                    text: controller.model.email,
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize),
                                  ),
                                  const SizedBox(height: kSpacing),
                                  RichLable(
                                    text: controller.model.age.toString(),
                                    style: TextStyle(
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize),
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        );

        if (controller.model.fullName == null) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.withAlpha(150),
            highlightColor: Colors.grey.withAlpha(20),
            enabled: true,
            child: content,
          );
        } else {
          return content;
        }
      });
    });
  }
}
