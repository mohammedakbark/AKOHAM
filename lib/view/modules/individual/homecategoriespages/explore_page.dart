import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';
import 'package:orphanagemanagement/view/modules/individual/explre_singleorphanage_page.dart';
import 'package:orphanagemanagement/view/modules/individual/main_page_individual.dart';

class ExplorePageInHomeIndividual extends StatefulWidget {
  const ExplorePageInHomeIndividual({super.key});

  @override
  State<ExplorePageInHomeIndividual> createState() =>
      _ExplorePageInHomeIndividualState();
}

class _ExplorePageInHomeIndividualState
    extends State<ExplorePageInHomeIndividual> {
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          height: hight,
          width: width,
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(60),
              customeText(text: "Home", size: 26),
              Gap(20),
              customeTextField(
                prefixicon: Image.asset(
                  "assets/search.png",
                  scale: 20,
                ),
                radius: 30,
                fillcolor: appThemeGrey,
                hintText: 'Search an orphanage',
              ),
              const Gap(20),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Image.asset(
                    "assets/leftarrow.png",
                    scale: 20,
                  )),
              customeText(text: "Explore", size: 22),
              const Gap(15),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => exploreOrphanages(
                          onTap: () {
                            Get.to(ExploreSingleOrphanagePafeIndividual());
                          },
                          hight: hight,
                          width: width,
                          orphnName: "Orphane Nmae",
                          numOfChile: "Number of Child",
                          contNumber: "context niumber",
                          srcimg:
                              "https://s3-alpha-sig.figma.com/img/fa20/bc06/2deb16afff00b283a126f9a481cc148d?Expires=1702252800&Signature=b9iRbTh9yLYbkE68~FSYMaDa1Lh0zzqNV-a8IKciexYYuYXp9AE5XJR93u0JQD1x9ph6AeCYAB65t7vda58fNOWEaYXU5FOH9LxGT-GfbUZKhC-6hUowW2gUnOk5AqUJnFoVB5l3XaKvnZBqhaZ7aY3N2lxcVbXi5pYWzgqIfjP5lFHPgEbhCognYoZue3tiN5vDA3iEyv3MqndDFyFsmMmwEasEzFP~DnpLP1fFULJaY3G7ioA09B~g5vBzaJXVFQH~eN-GKvminC5FKqQtu4cWRoGu7uWdKfPNX4jANk0IZJdu4PW1PFqvkayprGEI0d4j1y8Uzw1OjjeHJh179g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                      separatorBuilder: (context, index) => Gap(20),
                      itemCount: 3))
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          onTap: (index) {
            setState(() {
              if (index == 0) {
                Get.to(MainPageIndividual(selectedIndex: 0));
              } else if (index == 1) {
                Get.to(MainPageIndividual(selectedIndex: 1));
              } else {
                Get.to(MainPageIndividual(selectedIndex: 2));
              }
            });
          },
          items: [
            BottomNavigationBarItem(
                // activeIcon: Image.asset(
                //   "assets/chatG.png",
                // ),
                icon: Image.asset(
                  "assets/chatIndivi.png",
                ),
                label: ""),
            BottomNavigationBarItem(
                // activeIcon: Image.asset(
                //   "assets/homeG.png",
                // ),
                icon: Image.asset(
                  "assets/homeIndivi (2).png",
                ),
                label: ""),
            BottomNavigationBarItem(
                // activeIcon: Image.asset(
                //   "assets/userG.png",
                // ),
                icon: Image.asset(
                  "assets/userIndivi.png",
                ),
                label: ""),
          ],
        ));
  }

  Widget exploreOrphanages(
      {hight,
      width,
      orphnName,
      numOfChile,
      contNumber,
      required String srcimg,
      Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: appThemeGrey,
        ),
        height: hight * .15,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      srcimg,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customeText(text: orphnName, size: 18),
                  customeText(text: numOfChile, textcolor: grey600),
                  customeText(text: contNumber, textcolor: grey600),
                  SizedBox(
                    child: Row(children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: blue,
                      ),
                      customeText(text: "Location", textcolor: blue)
                    ]),
                  )
                ],
              ),
            ),
            Gap(10),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: grey600,
                ))
          ],
        ),
      ),
    );
  }
}
