import 'package:flutter/material.dart';


class CollaboratePage extends StatefulWidget {
  
  @override
  _CollaboratePageState createState() => _CollaboratePageState();
}

class _CollaboratePageState extends State<CollaboratePage> with AutomaticKeepAliveClientMixin {
 
  @override
  Widget build(BuildContext context) {
     
      return Scaffold(
      body: SafeArea(
              child: Container(
                color: Colors.blue[200],
                child: Center(child: Text('Collaborate Page')),
                )
        ),
      );
  }

  @override
  bool get wantKeepAlive => true;

 
}


