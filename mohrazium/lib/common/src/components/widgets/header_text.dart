part of common.components;

class HeaderText extends StatelessWidget {
  const HeaderText(
    this.data, {
    Key? key,
  }) : super(key: key);
  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
