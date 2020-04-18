import 'package:flutter/material.dart';
import 'package:noticiero/src/pages/tabs_page.dart';
import 'package:provider/provider.dart';

import 'src/providers/zenotiProvider.dart';
 
void main() => runApp(MyApp());
 //final currentStatus = Provider.of<ZenotiProvider>(context);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ZenotiProvider>(
        create: (context) => ZenotiProvider(),
        child: MaterialApp(
        title: 'Zenoti',
       // theme: miTema,
        debugShowCheckedModeBanner: false,
        home: TabsPage()
      ),
    );
  }
}