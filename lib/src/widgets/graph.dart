import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticiero/src/models/stock.dart';

Widget getChart(List<charts.Series<Stock, String>> _seriesData){

  return  Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'SO₂ emissions, by world region (in million tonnes)',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.LineChart(
                            _seriesData,
                            animate: true,
                            //barGroupingType: charts.BarGroupingType.grouped,
                            //behaviors: [new charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );

}