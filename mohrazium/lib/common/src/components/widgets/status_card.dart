part of common.components;

class StatusCardData {
  final String label;
  final String value;
  final String descriptions;

  const StatusCardData({
    required this.label,
    required this.value,
    required this.descriptions,
  });
}

class StatusCard extends StatelessWidget {
  const StatusCard({
    required this.data,
    required this.primary,
    required this.onPrimary,
    Key? key,
  }) : super(key: key);

  final StatusCardData data;
  final Color primary;
  final Color onPrimary;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primary, primary.withOpacity(.7)],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
            ),
            child: _BackgroundDecoration(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildLabel(),
                          const SizedBox(height: 20),
                          _buildValuePresenter(),
                        ],
                      ),
                    ),
                    const Spacer(flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDescriptions(),
                        // SizedBox(
                        //   height: 20,
                        //   child: VerticalDivider(
                        //     thickness: 1,
                        //     color: onPrimary,
                        //   ),
                        // ),
                        // _buildHours(),
                      ],
                    ),
                    // const Spacer(flex: 2),
                    // _doneButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel() {
    return Text(
      convertEnToFa(data.label),
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: onPrimary,
        letterSpacing: 1,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildValuePresenter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          decoration: BoxDecoration(
            color: onPrimary.withOpacity(.3),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Center(
            child: Text(
              convertEnToFa(data.value),
              style: TextStyle(
                color: onPrimary,
                fontSize: Fonts.headline3().fontSize,
                letterSpacing: 1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptions() {
    return _IconLabel(
      color: onPrimary,
      iconData: EvaIcons.listOutline,
      label: convertEnToFa(data.descriptions),
    );
  }

  // Widget _buildHours() {
  //   return _IconLabel(
  //     color: onPrimary,
  //     iconData: EvaIcons.clockOutline,
  //     label: data.descriptions.descriptions(),
  //   );
  // }

  // Widget _doneButton() {
  //   return ElevatedButton.icon(
  //     onPressed: () {},
  //     style: ElevatedButton.styleFrom(
  //       primary: onPrimary,
  //       onPrimary: primary,
  //     ),
  //     icon: const Icon(EvaIcons.checkmarkCircle2Outline),
  //     label: const Text("Done"),
  //   );
  // }
}

class _IconLabel extends StatelessWidget {
  const _IconLabel({
    required this.color,
    required this.iconData,
    required this.label,
    Key? key,
  }) : super(key: key);

  final Color color;
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: color,
          size: Fonts.subtitle1().fontSize,
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: Fonts.subtitle1().fontSize,
            color: color.withOpacity(.8),
          ),
        )
      ],
    );
  }
}

class _BackgroundDecoration extends StatelessWidget {
  const _BackgroundDecoration({required this.child, Key? key})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Transform.translate(
            offset: const Offset(25, -25),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white.withOpacity(.1),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Transform.translate(
            offset: const Offset(-70, 70),
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white.withOpacity(.1),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
