import '../data/mock_data.dart';
import '../responsive.dart';
import '../styles/styles.dart';
import 'currency_text.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartWithTitle extends StatelessWidget {
  final String title;
  final Color barColor;
  final double amount;

  const BarChartWithTitle({
    Key? key,
    required this.title,
    required this.amount,
    required this.barColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: Styles.defaultBorderRadius,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(Styles.defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.more_vert),
            ],
          ),
          const SizedBox(height: 10),
          Responsive.isDesktop(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CurrencyText(
                      currency: "\$",
                      amount: amount,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'on this week',
                      style: TextStyle(
                        color: Styles.defaultGreyColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              : Column(
                  children: <Widget>[
                    CurrencyText(
                      currency: "\$",
                      amount: amount,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'on this week',
                      style: TextStyle(
                        color: Styles.defaultGreyColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
          const SizedBox(
            height: 38,
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (group) => Colors.grey,
                    getTooltipItem: (_a, _b, _c, _d) => null,
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: Responsive.isMobile(context) ? 45 : 0,
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 0:
                            return Text(
                              'Mon',
                              style: TextStyle(
                                color: Styles.defaultLightGreyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          case 1:
                            return Text(
                              'Tue',
                              style: TextStyle(
                                color: Styles.defaultLightGreyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          case 2:
                            return Text(
                              'Wed',
                              style: TextStyle(
                                color: Styles.defaultLightGreyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          case 3:
                            return Text(
                              'Thu',
                              style: TextStyle(
                                color: Styles.defaultLightGreyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          case 4:
                            return Text(
                              'Fri',
                              style: TextStyle(
                                color: Styles.defaultLightGreyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          case 5:
                            return Text(
                              'Sat',
                              style: TextStyle(
                                color: Styles.defaultLightGreyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          case 6:
                            return Text(
                              'Sun',
                              style: TextStyle(
                                color: Styles.defaultLightGreyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          default:
                            return Text(
                              '',
                              style: TextStyle(
                                color: Styles.defaultLightGreyColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                        }
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: MockData.getBarChartitems(
                  barColor,
                  width: Responsive.isMobile(context) ? 10 : 25,
                ),
                gridData: FlGridData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
