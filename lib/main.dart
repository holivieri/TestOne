import 'package:flutter/material.dart';
import 'package:noticiero/src/pages/tabs_page.dart';
import 'package:noticiero/src/services/ZenotiService.dart';
import 'package:provider/provider.dart';

import 'src/providers/zenotiProvider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider( create: (_) => new ZenotiService()),
          ChangeNotifierProvider( create: (_) => new ZenotiProvider()),
        ],
        child: MaterialApp(
        title: 'Zenoti',
       // theme: miTema,
        debugShowCheckedModeBanner: false,
        home: TabsPage()
      ),
    );
  }
}