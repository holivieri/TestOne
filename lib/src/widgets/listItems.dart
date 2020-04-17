import 'package:flutter/material.dart';

Widget getListItems(){

  return Container(
    height: 400,
    width: 500,
    color: Colors.white,
    child: Column(children: <Widget>[
          _createListTile( 'Avg. Ticket size', 'Viewing Now', 6571.45, '453k', Colors.green),
          _createListTile( 'Product Revenue', '', 2355.20, '2k', Colors.grey),
          _createListTile( 'Avg. Invoice Value', '', 1850.11, '3k', Colors.red),
          _createListTile( 'Product Revenue', '', 244.30, '400k', Colors.green),
          _createListTile( 'Avg. Invoice Value', '', 3577.45, '950k', Colors.red),

    ],)
  );

}

ListTile _createListTile(String text1, String text2, double value1, String value2, Color c) {

  return ListTile(
              title: (text2 != '' ? Text(text1, style: TextStyle(fontWeight: FontWeight.bold)) : Text(text1)),
              subtitle: Text(text2),
              trailing: _createtrail(value1, value2, c, text2 != ''),
            );
}

Widget _createtrail(double value, String value2, Color c, bool bold){
  return Column(children: <Widget>[
      //SizedBox(height: 5.0),
      (bold ? Text('\$ ' + value.toStringAsFixed(2), textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))
            : Text('\$ ' + value.toStringAsFixed(2), textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0))
      ),
      SizedBox(height: 10.0),
      Container(
            height: 25,
            width: 100,
            child: Padding(
                         padding: const EdgeInsets.all(4.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                                Text(value2, style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                                SizedBox(width: 8.0),
                                (c == Colors.green ?  Icon(Icons.arrow_upward, color: Colors.white) : Icon(Icons.arrow_downward, color: Colors.white))
                           ],
                         ),
                       ),
          decoration: BoxDecoration(
                      color: c,
                      border: Border.all(
                        width: 1.0,
                        color: c
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(15.0) 
                      ),
                    )
        )
  ]);

}