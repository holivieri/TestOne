import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:noticiero/src/models/sales.dart';

class MyChart extends StatefulWidget {

  final String title;

  const MyChart(this.title);


  @override
  _MyChartState createState() => _MyChartState(title);
}

class _MyChartState extends State<MyChart> {

  List<charts.Series<Sales, int>> _seriesLineData;
  String _title;

  _MyChartState(String title){
      _title = title;
  }

   _generateData() {
    var linesalesdata = [
      new Sales(0, 45),
      new Sales(1, 56),
      new Sales(2, 55),
      new Sales(3, 60),
      new Sales(4, 61),
      new Sales(5, 70),
    ];
    var linesalesdata1 = [
      new Sales(0, 35),
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 50),
      new Sales(4, 51),
      new Sales(5, 60),
    ];

    var linesalesdata2 = [
      new Sales(0, 20),
      new Sales(1, 24),
      new Sales(2, 25),
      new Sales(3, 40),
      new Sales(4, 45),
      new Sales(5, 60),
    ];

      
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.lime),
        id: 'Canada',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.month,
        measureFn: (Sales sales, _) => sales.quantity,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.purple),
        id: 'Canada',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.month,
        measureFn: (Sales sales, _) => sales.quantity,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Colors.orange),
        id: 'Canada',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.month,
        measureFn: (Sales sales, _) => sales.quantity,
      ),
    );
  }
  

  @override
  void initState() { 
    super.initState();
    _seriesLineData = List<charts.Series<Sales, int>>();
    _generateData();
  }
  @override
  Widget build(BuildContext context) {
   // final currentStatus = Provider.of<ZenotiProvider>(context);

    return  Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  
                  color: Color(0xFF30A3DA), 
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            _title ,style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold, color: Colors.white),),
                        Expanded(
                          child: charts.LineChart(
                            _seriesLineData,
                            defaultRenderer: new charts.LineRendererConfig(
                                includeArea: true, stacked: true),
                            animate: true,
                            animationDuration: Duration(seconds: 3),
                            behaviors: [
                                  new charts.ChartTitle('Years',
                                      behaviorPosition: charts.BehaviorPosition.bottom,
                                      titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                                  new charts.ChartTitle('Sales',
                                      behaviorPosition: charts.BehaviorPosition.start,
                                      titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                                  new charts.ChartTitle('Departments',
                                      behaviorPosition: charts.BehaviorPosition.end,
                                      titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
                                      )   
                                ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }
}


