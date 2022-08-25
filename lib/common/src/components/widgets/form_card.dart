part of common.components;

class FormCard extends StatelessWidget with DateConverterMixin {
  final Key? globalFormKey;
  final bool readyOnly;
  final Function() onConfirmButtonPressed;
  final Function() onCancelButtonPressed;
  final double? maxWidth;
  final double? minWidth;
  final Color? color;
  final Color? headerColor;
  final Widget headerContent;
  final Widget child;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool haveShadow;
  final Widget? footerChild;

  const FormCard({
    Key? key,
    this.globalFormKey,
    required this.readyOnly,
    required this.onConfirmButtonPressed,
    required this.onCancelButtonPressed,
    this.maxWidth,
    this.minWidth,
    this.color,
    this.headerColor,
    required this.headerContent,
    required this.child,
    this.haveShadow = false,
    this.footerChild,
    this.createdAt,
    this.updatedAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var translator = Translations.of(context);
    return Form(
      key: globalFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: minWidth ?? 200, maxWidth: maxWidth ?? 520),
            child: GroupBox(
              haveShadow: haveShadow,
              color: color ?? Theme.of(context).cardTheme.color,
              child: Column(
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            color: headerColor ??
                                Theme.of(context).primaryColor.withAlpha(100),
                            child: Padding(
                                padding: const EdgeInsets.all(kPadding),
                                child: headerContent),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(kPadding),
                              child: child),
                        ],
                      ),
                      _buildFooter(context, footerChild, translator),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(
      BuildContext context, Widget? footerChild, var translator) {
    Widget _buildConfirmButton() {
      return ElevatedButton.icon(
        icon: Icon(
          readyOnly ? EvaIcons.edit : EvaIcons.checkmark,
          size: 24,
        ),
        onPressed: () => onConfirmButtonPressed(),
        label: Text(readyOnly ? translator.edit : translator.NotSAVE),
      );
    }

    Widget _buildCancelButton(BuildContext context) {
      return ElevatedButton(
        onPressed: readyOnly ? null : () => onCancelButtonPressed(),
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.secondary,
          onPrimary: Theme.of(context).colorScheme.onSecondary,
        ),
        child: Text(translator.cancel),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, kPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                createdAt != null
                    ? "${translator.createdAt}: ${toShamsi(createdAt)}"
                    : "",
                style: Themizer.light.textTheme.caption,
              ),
              Text(
                updatedAt != null
                    ? "${translator.updatedAt}: ${toShamsi(updatedAt)}"
                    : "",
                style: Themizer.light.textTheme.caption,
              ),
            ],
          ),
          Row(
            children: [
              footerChild ?? Container(),
              const SizedBox(
                width: kSpacing / 2,
              ),
              _buildConfirmButton(),
              const SizedBox(
                width: kSpacing / 2,
              ),
              _buildCancelButton(context)
            ],
          ),
        ],
      ),
    );
  }
}
