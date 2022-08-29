part of mohrazium.features.portfolio;

class RichLable extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  const RichLable({
    Key? key,
    this.text,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final langCode = Translations.of(context).languageCode;
    return Text.rich(
      TextSpan(text: text),
      locale: TranslationProvider.of(context).flutterLocale,
      textDirection: langCode == 'fa' || langCode == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      textAlign: langCode == 'fa' || langCode == 'ar'
          ? TextAlign.right
          : TextAlign.left,
      style: style,
    );
  }
}
