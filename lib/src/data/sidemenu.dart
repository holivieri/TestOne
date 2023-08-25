import 'package:enablapp/src/models/menuitem_model.dart';
import 'package:flutter/material.dart';

List<MenuModel> menu = [
  new MenuModel(
    title: 'Dark/Light Mode',
    icon: Icons.color_lens,
    route: '/ThreeDimenssionBottomNavigationBar',
    type: MenuItemType.CONFIG,
  ),
  new MenuModel(
    title: 'Change Password',
    icon: Icons.security,
    route: '/Trending',
    type: MenuItemType.SECURITY,
  ),
  new MenuModel(
    title: 'Delete my personal data',
    icon: Icons.account_box,
    route: '/ProfileOne',
    type: MenuItemType.SECURITY,
  ),
  new MenuModel(
    title: 'Logout',
    icon: Icons.highlight_off,
    route: '/WhatsApp',
    type: MenuItemType.SECURITY,
  ),
  new MenuModel(
    title: 'Sync',
    icon: Icons.sync,
    route: '/SmartPlant',
    type: MenuItemType.SECURITY,
  ),
  new MenuModel(
    title: 'Double factor Auth',
    icon: Icons.brightness_auto,
    route: '/HospitalDashboard',
    type: MenuItemType.SECURITY,
  ),
  new MenuModel(
    title: 'Facebook profile',
    icon: Icons.verified_user,
    type: MenuItemType.COMMUNICATION,
    route: '/GoogleAuth',
    isRoot: true,
  ),
  new MenuModel(
    title: 'Twitter account',
    icon: Icons.pageview,
    type: MenuItemType.COMMUNICATION,
    route: '/WebviewFlutter',
  ),
  new MenuModel(
    title: 'LinkedIn profile',
    icon: Icons.settings_applications,
    type: MenuItemType.COMMUNICATION,
    route: '/ReduxFlutter',
    isRoot: true,
  ),
];
