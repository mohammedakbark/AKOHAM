import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:orphanagemanagement/model/orphanage/orphn_reg_model.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/childdetails_tab.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/home_tab.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/profile_tab.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/settings_tab.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:provider/provider.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainPageOrphanage extends StatefulWidget {
  OrphnRegModel? orphnRegModel;
  BankDetailModel? bankDetailModel;
  MainPageOrphanage({super.key, this.bankDetailModel, this.orphnRegModel});

  @override
  State<MainPageOrphanage> createState() => _MainPageOrphanageState();
}

class _MainPageOrphanageState extends State<MainPageOrphanage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
 
    // Provider.of<FireStore>(context, listen: false)
    // .fetchCurrentOrphanage(currentUserId);

    // print(widget.orphnRegModel!.email);
    List<Widget> pages = [
      HomeTabOrphanage(
        orphnRegModel: widget.orphnRegModel!,
      ),
      const ChildDetailsTabOrphanage(),
      ProfileTabOrphanage(
        orphnRegModel: widget.orphnRegModel!,
        bankDetailModel: widget.bankDetailModel!,
      ),
      SettingsTabOrphanage(
        orphnRegModel: widget.orphnRegModel!,
        bankDetailModel: widget.bankDetailModel!,
      )
    ];
    return Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset("assets/home.png"), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("assets/Upload.png"), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("assets/profile.png"), label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("assets/Settings.png"), label: "")
          ],
        ));
  }
}
