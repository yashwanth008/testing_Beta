import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


class errorModel {
  String? error;
  int? value;
  charts.Color? barColor;

  errorModel({this.error, this.value}) {
    if (value! <= 20) {
      barColor = charts.ColorUtil.fromDartColor(Colors.green);
    } else {
      barColor = charts.ColorUtil.fromDartColor(Colors.red);
    }
  }
}