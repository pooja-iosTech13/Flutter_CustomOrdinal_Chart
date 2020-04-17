import 'package:flutter/material.dart';

import 'barGraphLayout.dart';
import 'barSecondaryAxes.dart';
import 'ordinalCombo.dart';
import 'package:charts_flutter/flutter.dart' as charts;

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// This is my new feature branch without conflict..

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ""),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Widget incrementCounter() {
   return GalleryScaffold(
     listTileIcon: new Icon(Icons.insert_chart),
     title: 'Custom Combo Chart',
     subtitle: 'Custom chart with bars and lines',
     childBuilder: () => new OrdinalComboBarLineChart.withSampleData(createSampleData()),
   );
  }

  @override
  Widget build(BuildContext context) {
    return incrementCounter();
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> createSampleData() {
    
     final mobileSalesData = [
       new OrdinalSales('2014', 70),
       new OrdinalSales('2015', 50),
       new OrdinalSales('2016', 30),
       new OrdinalSales('2017', 50),
       new OrdinalSales('2018', 40),
       new OrdinalSales('2019', 40),
       new OrdinalSales('2020', 20),
       new OrdinalSales('2021', 70),
       new OrdinalSales('2022', 60),
       new OrdinalSales('2023', 80),
       new OrdinalSales('2024', 50),
       new OrdinalSales('2025', 60),
       new OrdinalSales('2026', 50),
       new OrdinalSales('2027',40),
    ];
    final desktopSalesData = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 40),
      new OrdinalSales('2017', 25),
      new OrdinalSales('2018', 50),
      new OrdinalSales('2019', 40),
      new OrdinalSales('2020', 20),
      new OrdinalSales('2021', 20),
      new OrdinalSales('2022', 20),
      new OrdinalSales('2023', 10),
      new OrdinalSales('2024', 40),
      new OrdinalSales('2025', 10),
      new OrdinalSales('2026', 10),
      new OrdinalSales('2027',20),
    ];
   

    final score = [
      new OrdinalSales('2014', 20),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 30),
      new OrdinalSales('2017', 25),
      new OrdinalSales('2018', 10),
      new OrdinalSales('2019', 20),
      new OrdinalSales('2020', 60),
      new OrdinalSales('2021', 10),
      new OrdinalSales('2022', 20),
      new OrdinalSales('2023', 10),
      new OrdinalSales('2024', 10),
      new OrdinalSales('2025', 30),
      new OrdinalSales('2026', 40),
      new OrdinalSales('2027',40),
    ];

    final losAngelesSalesData = [
      new OrdinalSales('2014', 70),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 30),
      new OrdinalSales('2017', 50),
      new OrdinalSales('2018', 40),
      new OrdinalSales('2019', 40),
      new OrdinalSales('2020', 20),
      new OrdinalSales('2021', 70),
      new OrdinalSales('2022', 60),
      new OrdinalSales('2023', 80),
      new OrdinalSales('2024', 50),
      new OrdinalSales('2025', 60),
      new OrdinalSales('2026', 50),
      new OrdinalSales('2027',40),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Desktop',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: desktopSalesData),
      new charts.Series<OrdinalSales, String>(
          id: 'Score',
          colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: score),
    new charts.Series<OrdinalSales, String>(
    id: 'Los Angeles Revenue',
    domainFn: (OrdinalSales sales, _) => sales.year,
    measureFn: (OrdinalSales sales, _) => sales.sales,
              colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,

    data: losAngelesSalesData,
    )..setAttribute(charts.measureAxisIdKey, 'secondaryMeasureAxisId'),
      new charts.Series<OrdinalSales, String>(
          id: 'Mobile ',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: mobileSalesData)
      // Configure our custom line renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customLine'),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
