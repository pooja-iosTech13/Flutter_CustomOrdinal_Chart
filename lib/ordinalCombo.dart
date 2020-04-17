import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class OrdinalComboBarLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  OrdinalComboBarLineChart(this.seriesList, {this.animate});
  final labels = charts.BasicNumericTickFormatterSpec((num value) =>  'MyValue: ${[value.toInt()]}');


  factory OrdinalComboBarLineChart.withSampleData(List<charts.Series> series) {
    return new OrdinalComboBarLineChart(
      series,
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      ConstrainedBox(
        constraints: BoxConstraints.expand(height: 100.0, width: double.infinity), child:new charts.OrdinalComboChart(seriesList,
        animate: animate,
        behaviors: [
          // A pan and zoom behavior helps demonstrate the sliding viewport
          // behavior by allowing the data visible in the viewport to be adjusted
          // dynamically.
          new charts.PanAndZoomBehavior(),
          new charts.InitialSelection(selectedDataConfig: [
            new charts.SeriesDatumConfig<String>('Sales', '2016')
          ]),
        ],
        defaultRenderer: new charts.BarRendererConfig(
            groupingType: charts.BarGroupingType.groupedStacked,

        ),
        // Custom renderer configuration for the line series. This will be used for
        // any series that does not define a rendererIdKey.
        domainAxis: new charts.OrdinalAxisSpec(
            viewport: new charts.OrdinalViewport('2018', 4)),
         primaryMeasureAxis: new charts.NumericAxisSpec(tickFormatterSpec: labels),
      secondaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec:
          new charts.BasicNumericTickProviderSpec(desiredTickCount: 5)),
        customSeriesRenderers: [
          new charts.LineRendererConfig(
            // ID used to link series to this renderer.
              customRendererId: 'customLine')
        ]));
  }

}




