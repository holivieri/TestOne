import 'package:flutter/material.dart';



class Tab2Page extends StatefulWidget {
  
  @override
  _Tab2PageState createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page> with AutomaticKeepAliveClientMixin {
 
  @override
  Widget build(BuildContext context) {
     
      return Scaffold(
      body: SafeArea(
              child: Container(
                color: Colors.blue[200],
                child: Center(child: Text('Another tab')),
                )
        ),
      );
  }

  @override
  bool get wantKeepAlive => true;

 
}


