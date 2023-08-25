import 'dart:developer';
import 'package:enablapp/src/localization/app_translation.dart';
import 'package:enablapp/src/theme/constants.dart';
import 'package:flutter/material.dart';

const menuItems = <Map<String, dynamic>>[
  {
    'icon': Icons.dashboard,
    'title': 'dashboard',
  },
  {
    'icon': Icons.chat,
    'title': 'collaborate',
  },
  {
    'icon': Icons.menu,
    'title': 'menu',
  },
];

class DashboardScreen extends StatefulWidget {
  final String? title;

  DashboardScreen({Key? key, this.title}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<DashboardScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//  EnablMetric selectedMetric;
  DateTime? activeDate;

  @override
  void initState() {
    super.initState();
    activeDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Slight light to dark blue gradient in app bar area
        Container(
          height: 650.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(53, 177, 223, 1),
                  Color.fromRGBO(0, 124, 192, 1)
                ]),
          ),
        ),
        Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          drawer: Drawer(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Column(
              children: <Widget>[
                Text(AppTranslations.of(context).text('organization_name'),
                    style: TextStyle(fontSize: 20.0)),
                Text(
                  AppTranslations.of(context).text('lastupd_timestamp_ticker'),
                  style: TextStyle(color: Colors.white38, fontSize: 14.0),
                ),
              ],
            ),
            /*  bottom: PreferredSize(
              preferredSize: Size(0.0, 90.0),
              child: Padding(
                padding: EdgeInsets.all(spacer),
                child: StatList(
                  items: statListItems,
                ),
              ),
            ), */
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Text('hello world'),
          /* CardList(
            activeDate: activeDate,
            selectedMetric: selectedMetric,
            onCloseTap: () {
              setState(() {
                selectedMetric = null;
              });
            },
            onItemTap: (i) {
              setState(() {
                selectedMetric = i;
              });
            },
            onSelectDate: (date) {
              setState(() {
                activeDate = date;
              });
            },
          ), */
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 100,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedItemColor: themeBlue,
            onTap: (index) {
              log('Index: $index');
              if (_scaffoldKey.currentState!.isDrawerOpen) {
                _scaffoldKey.currentState!.openEndDrawer();
              } else {
                _scaffoldKey.currentState!.openDrawer();
              }
            },
            items: menuItems
                .map(
                  (item) => BottomNavigationBarItem(
                      icon: Icon(
                        item['icon'],
                      ),
                      label: 'app_menu_' + item['title']),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
