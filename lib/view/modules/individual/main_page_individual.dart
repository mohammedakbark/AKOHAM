import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:image_gradient/image_gradient.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/modules/individual/tabs/home_tab.dart';
import 'package:orphanagemanagement/view/modules/individual/tabs/notification_tab.dart';
import 'package:orphanagemanagement/view/modules/individual/tabs/profile_tab.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/childdetails_tab.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/home_tab.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/profile_tab.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/settings_tab.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainPageIndividual extends StatefulWidget {
    int selectedIndex = 1;
  MainPageIndividual({super.key,required this.selectedIndex});

  @override
  State<MainPageIndividual> createState() => _MainPageIndividualState();
}

class _MainPageIndividualState extends State<MainPageIndividual> {

  List<Widget> pages = [
    NotificationTabIndividual(),
    HomeTabIndividual(),
    ProfileTabIndividual()
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
