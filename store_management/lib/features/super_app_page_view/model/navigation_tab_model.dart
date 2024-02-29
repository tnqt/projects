import 'package:flutter/material.dart';
import 'package:home/home.dart' as home;
import 'package:product/product.dart' as product;

// import 'package:shared_module/shared_module.dart';


enum NavigationTab { home, order, product, menu }

extension NavigationTabExt on NavigationTab {
  static final _rawPageMap = {
    NavigationTab.home: const home.HomePage(),
    NavigationTab.order: Container(),
    NavigationTab.product: const product.ProductPage(),
    NavigationTab.menu: Container(),
  };

  Widget get destinationPage => _rawPageMap[this] ?? _rawPageMap.values.first;

  // static const _rawInactiveIconMap = {
  //   NavigationTab.home: "assets/icon/ic_dashboard_tab_inactive.png",
  //   NavigationTab.order: "assets/icon/ic_contact_tab_inactive.png",
  //   NavigationTab.product: "assets/icon/ic_reminder.png",
  //   NavigationTab.menu: "assets/icon/ic_notification_tab_inactive.png",
  // };

  // String get inactiveIcon => _rawInactiveIconMap[this] ?? _rawInactiveIconMap.values.first;

  // static const _rawTabNameMap = {
  //   NavigationTab.home: "dashboard",
  //   NavigationTab.order: "contacts",
  //   NavigationTab.Reminder: "tab_reminder_title",
  //   NavigationTab.Notification: "notification_setting",
  //   NavigationTab.Menu: "setting_title",
  // };

  // static var _rawIconMap = {
  //   NavigationTab.Home: CommonBottonNavBarIcon(iconPath: NavigationTab.Home.inactiveIcon),
  //   NavigationTab.Contact: CommonBottonNavBarIcon(iconPath: NavigationTab.Contact.inactiveIcon),
  //   NavigationTab.Reminder: CommonBottonNavBarIcon(iconPath: NavigationTab.Reminder.inactiveIcon),
  //   NavigationTab.Notification: NotificationActiveIcon(),
  //   NavigationTab.Menu: CommonBottonNavBarIcon(iconPath: NavigationTab.Menu.inactiveIcon),
  // };

  // String get tabName => _rawTabNameMap[this] ?? _rawTabNameMap.values.first;

  // Widget get navIcon => _rawIconMap[this] ?? _rawIconMap.values.first;

  // BottomNavigationBarItem navigationBarItem(BuildContext context) {
  //   return BottomNavigationBarItem(
  //       tooltip: "",
  //       label: AppLocalizations.of(context).translate(this.tabName),
  //       activeIcon: getImageWithSuitableColor(
  //         SizedBox(
  //           height: 23,
  //           child: AspectRatio(
  //             aspectRatio: 1 / 1,
  //             child: Image.asset(
  //               this.inactiveIcon,
  //               fit: BoxFit.fill,
  //             ),
  //           ),
  //         ),
  //       ),
  //       icon: this.navIcon);
  // }
}
