part of 'main.components.dart';

enum ChartRange { daily, monthly, yearly }

class GraphArea extends StatelessWidget {
  final ChartRange selectedRange;
  final List<FlSpot> spots1;
  final List<FlSpot> spots2;

  const GraphArea({
    super.key,
    required this.selectedRange,
    required this.spots1,
    required this.spots2,
  });

  List<String> getBottomLabels() {
    switch (selectedRange) {
      case ChartRange.monthly:
        return [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'Mei',
          'Jun',
          'Jul',
          'Agu',
          'Sep',
          'Okt',
          'Nov',
          'Des',
        ];
      case ChartRange.yearly:
        return ['2020', '2021', '2022', '2023', '2024'];
      case ChartRange.daily:
        final now = DateTime.now();
        return List.generate(7, (i) {
          final d = now.subtract(Duration(days: 6 - i));
          return "${_getShortDayName(d.weekday)}\n${d.day}";
        });
    }
  }

  String _getShortDayName(int weekday) {
    const days = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
    return days[(weekday - 1) % 7];
  }

  @override
  Widget build(BuildContext context) {
    final labels = getBottomLabels();

    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF19191E), Color(0xFF0B0B0D)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(12),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) => Text(
                  value.toStringAsFixed(0),
                  style: context.textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  int i = value.toInt();
                  if (i < 0 || i >= labels.length) return const SizedBox();
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      labels[i],
                      style: context.textTheme.labelSmall!.copyWith(
                        color: Colors.white60,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots1,
              isCurved: true,
              color: Colors.greenAccent,
              belowBarData: BarAreaData(
                show: true,
                color: Colors.greenAccent.withOpacity(0.3),
              ),
              dotData: FlDotData(show: false),
              barWidth: 4,
            ),
            LineChartBarData(
              spots: spots2,
              isCurved: true,
              color: Colors.yellowAccent,
              dotData: FlDotData(show: true),
              barWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
