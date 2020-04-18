import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noticiero/src/providers/zenotiProvider.dart';
import 'package:noticiero/src/widgets/graph.dart';
import 'package:provider/provider.dart';


class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}


class _HeaderState extends State<Header> {
  String _date  = '';
  TextEditingController _inputFieldDateController = new TextEditingController();
  Widget _graph;
   

  @override
  void initState() {
    // implement initState
    super.initState();
      
  }




  @override
  Widget build(BuildContext context) {
    return getheader1(context);
  }

Widget getheader1(BuildContext context) {
  
  
  return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF30A3DA),
              child: Column(children: <Widget>[
                              _createTitle(),
                              _createSumary(),
                              (_graph != null ? _showGraph(_date) : _hideGraph()),
                              iconsRow(context),
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
                        Container(color: Colors.white, width: 1.0),
                        summaryItem('UTILIZATION', '67%'),
                        Container(color: Colors.white, width: 1.0),
                        summaryItem('FEEDBACK', '4.7'),
                        Container(color: Colors.white, width: 1.0),
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
                height: 93,
                width: 93,
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


  Widget _showGraph(String date){
    
    return  Container(
              height: 400,//MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF30A3DA),
              child: MyChart(date)
            );
  }

    Widget _hideGraph(){
    
    return  Container(
              height: 0,
              width: 0,
              color: Color(0xFF30A3DA),
            );
  }


  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
    );

    if ( picked != null ) {
      setState(() {
          var formatter = new DateFormat('LLL.dd.yy');
          _date = formatter.format(picked);
          _inputFieldDateController.text = _date;
           Provider.of<ZenotiProvider>(context, listen: false).top = 500;
           Provider.of<ZenotiProvider>(context, listen: false).selectedDate = picked;
           Provider.of<ZenotiProvider>(context, listen: false).panelsize = 650;
           
          _graph = MyChart(_date);
      }); 
    }

  }

  void _createCalendar( BuildContext context ) {

    FocusScope.of(context).requestFocus(new FocusNode());
    _selectDate( context );
  }




Widget iconsRow(BuildContext context){
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
                            onPressed: () { _createCalendar(context); },
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
                         child: InkWell(
                                      onTap: (){ _createCalendar(context); },
                                      child: Row(
                                      children: <Widget>[
                                        Text(_date, style: TextStyle(color: Colors.white )),
                                        Icon(Icons.calendar_today, color: Colors.white)
                                      ],
                           ),
                         ),
                       ),
                       decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.0,
                                      color: Colors.white
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0) 
                                    ),
                                  )
                     )

            ])
        ],
  );

  

  }
}