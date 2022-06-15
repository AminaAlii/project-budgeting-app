// ignore_for_file: avoid_unnecessary_containers

import 'package:budgetapp/Models/income.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpanseChart extends StatelessWidget {
  List<IncomeModel> incomelist;
   ExpanseChart(this.incomelist, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', double.parse(incomelist.first.salary), Colors.green),
      ChartData('Others', double.parse(incomelist.first.interest), const Color.fromRGBO(255, 189, 57, 1)),
      ChartData('Steve', double.parse(incomelist.first.investment), Colors.red),
      ChartData('Jack', double.parse(incomelist.first.other), Colors.blue),
      ChartData('Jack', double.parse(incomelist.first.gifts), Colors.orange),
      ChartData('Jack', double.parse(incomelist.first.business), Colors.deepPurpleAccent),
];
    return Center(
        child: Container(
            child: SfCircularChart(series: <CircularSeries>[
      // Renders doughnut chart
      DoughnutSeries<ChartData, String>(
          explodeGesture: ActivationMode.singleTap,
          radius: "56%",
          innerRadius: "50",
          explode: true,
          enableTooltip: true,
          selectionBehavior:
              SelectionBehavior(enable: true, toggleSelection: true),
          dataSource: chartData,
          pointColorMapper: (ChartData data, _) => data.color,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y)
    ])));
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
