import 'package:flutter/material.dart';

enum MenuItemType { SECURITY, CONFIG, COMMUNICATION }

class MenuModel {
  IconData icon;
  String title;
  String route;
  bool isRoot;
  MenuItemType type;

  MenuModel({
    this.title,
    this.icon,
    this.route,
    this.isRoot = false,
    this.type = MenuItemType.SECURITY,
  });
}
