import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_agrisoil_app/Screen/calculator.dart';
import 'package:new_agrisoil_app/Screen/history_page.dart';
import 'package:new_agrisoil_app/Screen/home_page.dart';
import 'package:new_agrisoil_app/Screen/meassure_page.dart';
import 'package:new_agrisoil_app/Screen/meassurepage.dart';
import 'package:new_agrisoil_app/Screen/predict_page.dart';
import 'package:new_agrisoil_app/Screen/profilPage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Persistent_navbar extends StatelessWidget {
  const Persistent_navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    List<Widget> _buildScreens() {
      return [
        home_page(),
        meassurePage(),
        //history_page(),
        //calculator(),
        predict_page(),
        profil_page()
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: ("Beranda"),
          activeColorPrimary: CupertinoColors.activeGreen,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.graph_circle),
          title: ("Pengukuran"),
          activeColorPrimary: CupertinoColors.activeGreen, //merah terang
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        // PersistentBottomNavBarItem(
        //     icon: Icon(Icons.history_rounded),
        //     title: ("Riwayat"),
        //     activeColorPrimary: Colors.brown, //coklat
        //     inactiveColorPrimary: CupertinoColors.systemGrey),
        // PersistentBottomNavBarItem(
        //     icon: Icon(Icons.calculate),
        //     title: ("Kalkulator"),
        //     activeColorPrimary: Colors.orangeAccent, //coklat
        //     inactiveColorPrimary: CupertinoColors.systemGrey),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.antenna_radiowaves_left_right),
          title: ("Prediksi"),
          activeColorPrimary: CupertinoColors.activeGreen, //biru
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.profile_circled),
          title: ("Profil"),
          activeColorPrimary: CupertinoColors.activeGreen, //biru
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      hideNavigationBar: false,
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}
