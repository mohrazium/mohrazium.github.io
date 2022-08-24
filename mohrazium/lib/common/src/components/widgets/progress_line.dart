part of common.components;


class ProgressLineData {
  final int unitCapacity;
  final int totalSoldiers;

  const ProgressLineData({
    required this.unitCapacity,
    required this.totalSoldiers,
  });
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    required this.data,
    Key? key,
  }) : super(key: key);

  final ProgressLineData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText(context),
        const SizedBox(
          height: kSpacing / 5,
        ),
        _buildProgress(context),
      ],
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      convertEnToFa(
          "${data.totalSoldiers} تعداد  ${(data.unitCapacity.toString())}  از ظرفیت "),
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.surface,
        fontSize: 13,
      ),
    );
  }

  Widget _buildProgress(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: kSpacing / 3,
      width: kSpacing * 10,
      percent: data.totalSoldiers / data.unitCapacity,
      progressColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}
