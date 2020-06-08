import 'package:flutter/material.dart';
import 'package:enablApp/src/pages/home_page.dart';
import 'package:enablApp/src/pages/login_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
      'home'      : ( BuildContext context ) => HomePage(),
      'login'      : ( BuildContext context ) => LoginPage(),
  };
}