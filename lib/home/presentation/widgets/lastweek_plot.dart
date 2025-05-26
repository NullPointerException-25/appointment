import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:appointments_manager/home/presentation/controllers/plot_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LastWeekPlot extends StatefulWidget {
  const LastWeekPlot({super.key});

  @override
  State<LastWeekPlot> createState() => _LastWeekPlotState();
}

class _LastWeekPlotState extends State<LastWeekPlot> {
  List<Color> gradientColors = [ThemeColors.lightBlue, ThemeColors.darkBlue];
  final PlotController plotController = PlotController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (plotController.showGraph.value) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
              child: Text(Translator.workingHoursThisWeek.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: kFontSizeXL,
                   
                  ),),
            ),
            AspectRatio(
              aspectRatio: 1.70,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: kPaddingL, horizontal: kPadding),
                child: LineChart(
                  mainData(),
                ),
              ),
            ),
          ],
        );
      }
      return const SizedBox();
    });
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12,
    );
    Widget text = Text(
      plotController.plotDataList[value.toInt()].label,
      style: style,
    );

    return SideTitleWidget(
      meta: meta,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String? text = plotController.minutesHoursString[value.ceil()];
    if (text == null) {
      return const SizedBox();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        show: false,
      ),
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator: (barData, spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              const FlLine(
                color: ThemeColors.lightBlue,
                strokeWidth: 2,
              ),
              FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 8,
                      color: ThemeColors.lighterBlue,
                      strokeWidth: 0,
                      strokeColor: ThemeColors.lighterBlue,
                    );
                  }),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) {
            return ThemeColors.lightBlue;
          },
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              return LineTooltipItem(
                "${(touchedSpot.y.toInt())}:${(touchedSpot.y % 1 * 60).toInt().toString().padLeft(2, "0")}",
                const TextStyle(
                  color: ThemeColors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        ),
        touchSpotThreshold: 20,
        handleBuiltInTouches: true,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 80,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 7,
      minY: 0,
      maxY: plotController.maxY.value / 60,
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(8, (index) {
            return FlSpot(
              index.toDouble(),
              plotController.plotDataList[index].y.toDouble() / 60,
            );
          }),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 6,
                color: ThemeColors.lightBlue,
                strokeWidth: 1,
                strokeColor: ThemeColors.white,
              );
            },
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withValues(alpha: 0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
