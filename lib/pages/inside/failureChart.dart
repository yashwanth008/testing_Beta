import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:google_fonts/google_fonts.dart';

import 'dart:math';

import 'package:test_alpha/pages/inside/error_chart.dart';

class FailureChart extends StatelessWidget {
  final String? business;
  FailureChart({this.business});

  List<charts.Series<errorModel, String>> createChart() {
    Random random = Random();
    final chartData = [
      errorModel(error: "Failure1", value: random.nextInt(50)),
      errorModel(error: "Failure2", value: random.nextInt(50)),
      errorModel(error: "Failure3", value: random.nextInt(50))
    ];

    return [
      charts.Series<errorModel, String>(
          id: 'Failures',
          domainFn: (errorModel e, _) => e.error!,
          measureFn: (errorModel e, _) => e.value!,
          colorFn: (errorModel e, _) => e.barColor!,
          data: chartData)
    ];
  }

  @override
  Widget build(BuildContext context) {
    var seriesList = createChart();
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246,1),
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),),
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(246, 246, 246,1),
          title: Text(
              "Report",
            style: GoogleFonts.montserrat(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: charts.BarChart(
                    seriesList,
                    animate: true,
                    vertical: true,
                    defaultRenderer: charts.BarLaneRendererConfig(
                      cornerStrategy: charts.ConstCornerStrategy(15),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 1,
              child: Column(


                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0,0,25,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Failure 1: Missing product images",
                          style: GoogleFonts.montserrat(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        Text(
                            "Failure 2: Missing manufacture name",
                          style: GoogleFonts.montserrat(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        Text(
                            "Failure 3: Missing manufacture address",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Text(
                                "$business",
                              style: GoogleFonts.montserrat(fontSize: 22,fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
