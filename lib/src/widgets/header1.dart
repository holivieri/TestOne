
import 'package:flutter/material.dart';

import 'listItems.dart';

Widget getheader1(BuildContext context) {
  
  return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF30A3DA),
              child: Column(children: <Widget>[
                              _createTitle(),
                              _createSumary(),
                              iconsRow(),


                ])
          );

}

Widget _createTitle(){
  return Container(
              color: Color(0xFF30A3DA),
              child: Column(children: <Widget>[
                  Text('Your business name', style: TextStyle(fontSize: 20.0, color: Colors.white), textAlign: TextAlign.center),
                  Text('Updated 1hr ago', style: TextStyle(fontSize: 10.0, color: Colors.white), textAlign: TextAlign.center)
              ],)
            );



}
 Widget _createSumary(){
   
  
    return Container(
          child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text('Today', style: TextStyle(color: Colors.white), textAlign: TextAlign.start),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(children: <Widget>[
                        summaryItem('REVENUE', '\$ 117,454'),
                        Divider(color: Colors.white),
                        summaryItem('UTILIZATION', '67%'),
                         Divider(color: Colors.white),
                        summaryItem('FEEDBACK', '4.7'),
                        Divider(),
                        summaryItem('GUESTS', '718'),
                    ],
                  ),
                )
            ],
          ),
      );
  }

Widget summaryItem(String line1, String line2){
   TextStyle mystyle = TextStyle(color: Colors.white);

  return Container(
                height: 95,
                width: 95,
                color: Color (0xFF65B4DE),
                child: Column(children: <Widget>[
                      SizedBox(height: 10.0),
                      Text(line1, style: mystyle),
                      SizedBox(height: 20.0),
                      Text(line2, style: mystyle)
                  ]
                ) ,
            );
}

Widget iconsRow(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                    children: <Widget>[
                      RawMaterialButton(
                            onPressed: () {},
                            child: new Icon(
                              Icons.group,
                              color: Colors.white,
                            ),
                            shape: new CircleBorder(),
                            elevation: 2.0,
                            fillColor: Colors.blue,
                            //padding: const EdgeInsets.all(8.0),
                          ),
                      SizedBox(width: 10.0),
                      RawMaterialButton(
                            onPressed: () {},
                            child: new Icon(
                              Icons.location_on,
                              color: Colors.white,
                             // size: 15.0,
                            ),
                            shape: new CircleBorder(),
                            elevation: 2.0,
                            fillColor: Colors.blue,
                           // padding: const EdgeInsets.all(8.0),
                          ),
                ]
                ),
            ),
            Row(children: <Widget>[
                RawMaterialButton(
                            onPressed: () {},
                            child: new Text(
                                '4 W', style: TextStyle(color: Colors.white) 
                                ),
                            shape: CircleBorder(),
                            elevation: 2.0,
                            fillColor: Colors.blue,
                          ),
                      SizedBox(width: 10.0),
                     Container(
                       child: Padding(
                         padding: const EdgeInsets.all(4.0),
                         child: Row(
                           children: <Widget>[
                             Text('Aug.20.06', style: TextStyle(color: Colors.white )),
                             Icon(Icons.calendar_today, color: Colors.white)
                           ],
                         ),
                       ),
                       decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.0,
                                      color: Colors.white
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0) //         <--- border radius here
                                    ),
                                  )
                     )

            ],)
        ],
  );
}