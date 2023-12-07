import 'package:flutter/material.dart';

import 'package:orphanagemanagement/view/modules/organization/tabs/home_tab.dart';
import 'package:orphanagemanagement/view/modules/organization/tabs/notification_tab.dart';
import 'package:orphanagemanagement/view/modules/organization/tabs/profile_tab.dart';

class MainPageOrganization extends StatefulWidget {
    int selectedIndex = 1;
  MainPageOrganization({super.key,required this.selectedIndex});

  @override
  State<MainPageOrganization> createState() => _MainPageOrganizationState();
}

class _MainPageOrganizationState extends State<MainPageOrganization> {

  List<Widget> pages = [
    NotificationTabOrganization(),
    HomeTabOrganization(),
    ProfileTabOrganization()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[widget. selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex:widget. selectedIndex,
          onTap: (index) {
            setState(() {
           widget.   selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  "assets/chatG.png",
                ),
                icon: Image.asset(
                  "assets/chatIndivi.png",
                ),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  "assets/homeG.png",
                ),
                icon: Image.asset(
                  "assets/homeIndivi (2).png",
                ),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  "assets/userG.png",
                ),
                icon: Image.asset(
                  "assets/userIndivi.png",
                ),
                label: ""),
          ],
        ));
  }
}
