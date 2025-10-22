import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locabite/core/utility/check_location.dart';
import 'package:locabite/routes/chef/chef_main_page.dart';
import 'package:locabite/core/utility/app_colours.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ChefHomePage extends StatefulWidget {
  const ChefHomePage({super.key});

  @override
  State<ChefHomePage> createState() => _ChefHomePageState();
}

class _ChefHomePageState extends State<ChefHomePage> {
  // ignore: unused_field
  int _selectedIndex = 0;
  late PersistentTabController _controller;

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _buildScreens() {
    return [
      ChefMainPage(),
      Container(child: Center(child: Text('ik;ljf;akj'))),
      Container(child: Center(child: Text('ik;ljf;akj'))),
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: AppColours.darkbrown,
        inactiveColorPrimary: AppColours.lightBrown,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.payment),
        title: ("Transactions"),
        activeColorPrimary: AppColours.darkbrown,
        inactiveColorPrimary: AppColours.lightBrown,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Account"),
        activeColorPrimary: AppColours.darkbrown,
        inactiveColorPrimary: AppColours.lightBrown,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    checkLocation(context);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      padding: const EdgeInsets.only(top: 8),
      // backgroundColor: AppColours.cream,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle:
          NavBarStyle.style8, // Choose the nav bar style with this property
    );
  }
}
