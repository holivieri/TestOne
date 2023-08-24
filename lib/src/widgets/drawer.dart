import 'package:enablApp/src/data/sidemenu.dart';
import 'package:enablApp/src/models/menuitem_model.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

Widget getDrawer(BuildContext context) {
  Map<String, List<MenuModel>> items =
      groupBy<MenuModel, String>(menu, (MenuModel m) => m.type.toString());

  return Drawer(
    child: new ListView(
      padding: const EdgeInsets.only(top: 0),
      children: [
        UserAccountsDrawerHeader(
          accountEmail: Text('hernan.olivieri@gmail.com'),
          accountName: Text("Hernan Olivieri"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: ExactAssetImage("assets/img/myAvatar.png"),
            backgroundColor: Colors.transparent,
          ),
          margin: const EdgeInsets.only(bottom: 0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue[800],
                Colors.blue[700],
                Colors.blue[600],
                Colors.blue[400],
                Colors.blue[300],
              ],
            ),
          ),
        ),
        ..._buildSection(
          context: context,
          items: items[MenuItemType.CONFIG.toString()] ?? [],
          type: "Config",
        ),
        ..._buildSection(
          context: context,
          items: items[MenuItemType.SECURITY.toString()] ?? [],
          type: "Security",
        ),
        ..._buildSection(
          context: context,
          items: items[MenuItemType.COMMUNICATION.toString()] ?? [],
          type: "Communication",
        ),
      ],
    ),
  );
}

List<Widget> _buildSection(
    {BuildContext context, String type, List<MenuModel> items}) {
  return [
    Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: Container(
        height: 40,
        color: Colors.blueGrey,
        alignment: Alignment.center,
        child: Text(
          type,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    ),
    ...items.map((item) => _buildItem(item, context))
  ];
}

Widget _buildItem(MenuModel item, context) {
  return new ListTile(
    title: new Text(item.title!),
    leading: new Icon(item.icon),
    onTap: () {
      Navigator.pop(context);
      if (item.isRoot) {
        Navigator.pushReplacementNamed(context, item.route!);
      } else {
        Navigator.pushNamed(context, item.route!);
      }
    },
  );
}
