import 'package:flutter/material.dart';

Widget getListItems(){

  return Container(
    child: Column(children: <Widget>[
          ListTile(
              title: Text('test 1'),
              subtitle: Text('Viewing'),
              trailing: Column(children: <Widget>[
                    _creartrail(122.5,2.2),
                   
              ],
              )
            ),
    ],)
  );

}

Widget _creartrail(double value, double value2){
  return Column(children: <Widget>[
      Text(value.toStringAsFixed(2)),
      SizedBox(height: 10.0),
      Container(
                       child: Padding(
                         padding: const EdgeInsets.all(4.0),
                         child: Row(
                           children: <Widget>[
                             Text(value.toStringAsFixed(2), style: TextStyle(color: Colors.white )),
                           ],
                         ),
                       ),
                       decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.0,
                                      color: Colors.green
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0) //         <--- border radius here
                                    ),
                                  )
                     )
  ]);

}