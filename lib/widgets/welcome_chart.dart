import 'package:budgetapp/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget welcomechart() {
  return SizedBox(
      height: 35.h,
      width: 100.w,
      // width: 1299,
      child: SfCartesianChart(
          plotAreaBackgroundColor: Colors.white,
          crosshairBehavior: CrosshairBehavior(enable: true),
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
          ),
          margin: const EdgeInsets.all(0),
          trackballBehavior: TrackballBehavior(
              activationMode: ActivationMode.singleTap,
              lineType: TrackballLineType.vertical),
          legend: Legend(isVisible: false, opacity: 0),
          plotAreaBorderWidth: 0,
          primaryXAxis: CategoryAxis(
            autoScrollingMode: AutoScrollingMode.start,
            labelPlacement: LabelPlacement.onTicks,
            isVisible: false,
          ),
          primaryYAxis: CategoryAxis(isVisible: false),
          series: <SplineAreaSeries<SalesData, String>>[
            SplineAreaSeries<SalesData, String>(
                markerSettings:
                    const MarkerSettings(isVisible: false, height: 12, width: 12),
                selectionBehavior: SelectionBehavior(
                    enable: true, selectedBorderColor: Colors.red),
                gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: [
                      Colors.deepPurpleAccent.withOpacity(0.1),
                      Colors.grey.shade100
                    ]),
                borderColor: Colors.deepPurpleAccent,
                borderWidth: 5,

                // Bind data source
                dataSource: <SalesData>[
                  SalesData('Jan', 200),
                  SalesData('Feb', 200),
                  SalesData('Mar', 300),
                  SalesData('Apr', 200),
                  SalesData('May', 202),
                  SalesData('Jun', 120),
                  SalesData('jul', 220),
                  SalesData('Aug', 120),
                  SalesData('Sep', 120),
                  SalesData('Oct', 120),
                  SalesData('Nov', 120),
                  SalesData('Dec', 120),
                ],
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales)
          ]));
}
