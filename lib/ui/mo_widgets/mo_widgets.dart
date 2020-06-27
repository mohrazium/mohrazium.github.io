import 'package:flutter/material.dart';
import 'package:mohrazzr_ir/ui/themes/themes_provider.dart';

class MoCard extends StatelessWidget {
  const MoCard({this.child, this.children, this.width, this.height});
  final List<Widget> children;
  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: child != null
          ? Container(
              width: width,
              height: height,
              child: child,
            )
          : ListView(
              shrinkWrap: true,
              children: children,
            ),
    );
  }
}

class MoText extends StatelessWidget {
  const MoText({this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CustomTextStyles().h3().copyWith(
            inherit: true,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
