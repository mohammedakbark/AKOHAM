
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/childdetails_tab.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/home_tab.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/profile_tab.dart';
import 'package:orphanagemanagement/view/modules/orphanage/tabs/settings_tab.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainPageOrphanage extends StatefulWidget {
  MainPageOrphanage({super.key});

  @override
  State<MainPageOrphanage> createState() => _MainPageOrphanageState();
}

class _MainPageOrphanageState extends State<MainPageOrphanage> {
  int selectedIndex = 0;
  List<Widget> pages = [
    HomeTabOrphanage(),
    ChildDetailsTabOrphanage(),
    ProfileTabOrphanage(),
    SettingsTabOrphanage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset("assets/home.png"),
                //  Image.network(
                //   "https://s3-alpha-sig.figma.com/img/646e/f532/e36f4871ffdb7b89ba6ac6e0db513483?Expires=1702252800&Signature=krNVbA8GWHlA6GeQA1OlvYI8kBbZJagzPqFOJVuPAex~xn~n8YI1ugS-fJVgJLKv6mSPRI0Z9IZrJvsmdH7VJteGMHxkCQTGnAaJXa3VDS5-s0Whi4ZF8KTgYCaDEILZIZoizmCiJZ7Y7rdyaE6ghzr2Ud8ywMPcvtUXVO8NvX9WPiToEef2cdFuDLnqXrcWkOCP2FJGp2Uqz6GOU6if1NA1EhSFdebcRMIW3~hU1sQBUuWaf10OG2p3g9dFzKtgcTbOa~VaFT9WwLdKYGuz17bG4a9C0XH5g2Yjh3TRY9pCHd5~1AliGyA6~vAcmgDSh-P-7dbuQq2VUllzeidZdg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                //   scale: 3,
                // ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("assets/Upload.png"),
                //  Image.network(
                //   "https://s3-alpha-sig.figma.com/img/1bf7/da24/629f7074f035fadccd35cbfc12a71105?Expires=1702252800&Signature=PN0e7kpJNNJhNh~GsFQ6So8M4Uj5mjitHjj1eiVii2AYzfRgZT886fERZtLk30TM2l1bsrZnQkcKkJOhwBrnou~rxwucjkuEOOzKWBjZO~H9Buf6hXizCOrWoiu60xxee~DKciVXRpt9wX2YASqmWAkEHNe1EEQb-ATZa8wi4r4Wy7XtFbDBOePHRzStmvBMYs5ui7lqmeV~nS2mFvg1VSW6dU9AlcM5Z4Xj8DeyaF8VSsXRVP7xpGptZzOi6V2RKF8z6lfAGSdTMG2TiTjvzM6xCISWuuVHrH8HtH8GevPahRu99ZTvk1XA1YcNonNI2yOIne4xewNlNtChXw7-Mg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                //   scale: 3,
                // ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("assets/profile.png"),
                // Image.network(
                //   "https://s3-alpha-sig.figma.com/img/ef1c/1819/c809af77ed4da4c5fad63e504a8cc31b?Expires=1702252800&Signature=DhdvsPy-fKqRlR5bE2LQPHhEfyL03eCh04zPamHm76XIDopIegZ2hqWjy3yTYU9sqHrwuSX49i-79fCwiPPWDFe3oQaJ7Je5Bdsg9b-Ye~29DaXPVYzjiPawUulNm~whYquPJrtHYAYZ2Ws5KYyLL4JJLnSuE7PicAly4muQVicaT~Yh9SMJqsumaaz~UYGj66lWN0VyYIxcVg0k2pSpHb00Og2Co6LOkOhdkQ8PcXiOQZvt43~okAmC5bbSXMwYrkmL9XioMllvzUW74DkBSZuhgvgrA5U6ASxsPutmgLSUVJHL~PP3BM9NUjhlpYB0Oql049tfpVb4WweROYrNyg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                //   scale: 3,
                // ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("assets/Settings.png"),
                //  Image.network(
                //   "https://s3-alpha-sig.figma.com/img/c7da/2262/bd8d1f3fe443439d758c4fecf15a8c1b?Expires=1702252800&Signature=EALkoKLusML83fYkUdtjs3e6oK47F2f5C0LYomg3vAJJUeZGaYaPVrTR8SWMENdMO976uzamWiYsmXpqEzBEVQEFgmidJc2mAKItZ5XCb-gmhcyfS5ffEwVYltlCMssmc56TOdsJ8s4qL-RHOQDxcdzS2DUipdKfeTiXiqfJi~3ABiQ-LP3E2Xglyrk6sOI0PuGCbCwrQuqCvn16C4ZlQiyy2m6ln37-bMYWRQBDAY7mSXLN1G75yQev5aPAIUmU8VQYhYZvEH8dNR~LrTCc6CEsjYUMSUzuNyoOy33o2SmNVfNL-ZNx0HFxraNy4JmUKuaUX2GD2pKxAcc6LgFKVg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                //   scale: 3,
                // ),
                label: "")
          ],
        ));
  }
}
