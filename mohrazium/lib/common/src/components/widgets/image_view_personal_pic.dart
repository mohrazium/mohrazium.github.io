part of common.components;

class ImageViewPersonalPic extends StatelessWidget {
  final Image image;
  final void Function()? onNewPressed;
  final void Function()? onRemovePressed;

  const ImageViewPersonalPic({
    Key? key,
    required this.image,
    required this.onNewPressed,
    required this.onRemovePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var translator = Translations.of(context);
    return GroupBox(
        width: kTextFieldWidth,
        height: kTextFieldWidth * 1.2,
        margin: const EdgeInsets.all(kPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            image,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(90, 40),
                    ),
                    onPressed: onNewPressed,
                    icon: const Icon(EvaIcons.personAdd),
                    label: SizedBox(
                        width: 200,
                        child: Center(child: Text(translator.addNew)))),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(90, 40),
                    ),
                    onPressed: onRemovePressed,
                    icon: const Icon(EvaIcons.personDelete),
                    label: SizedBox(
                        width: 200,
                        child: Center(child: Text(translator.remove)))),
              ],
            )
          ],
        ));
  }
}
