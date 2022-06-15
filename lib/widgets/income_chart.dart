// ignore_for_file: avoid_unnecessary_containers

import 'package:budgetapp/Models/expense.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IncomeChart extends StatelessWidget {
  List<ExpenseModel> incomelist;
  IncomeChart(this.incomelist, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', double.parse(incomelist.first.rent), Colors.green),
      ChartData('Others', double.parse(incomelist.first.subscription),
          Colors.deepPurpleAccent),
      ChartData('Steve', double.parse(incomelist.first.food), Colors.red),
      ChartData('Jack', double.parse(incomelist.first.shopping), Colors.blue),
      ChartData('Jack', double.parse(incomelist.first.gym), Colors.red),
      ChartData('Jack', double.parse(incomelist.first.other),
          Colors.deepPurpleAccent),
      ChartData(
          'Jack', double.parse(incomelist.first.transportation), Colors.blue),
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
