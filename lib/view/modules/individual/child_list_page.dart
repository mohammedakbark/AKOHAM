import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/individual/main_page_individual.dart';
import 'package:orphanagemanagement/view/modules/individual/single_child_data.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Child/add_child_page.dart';
import 'package:orphanagemanagement/view/modules/orphanage/Child/single_child_data_page.dart';

class ChildListPageIndividual extends StatefulWidget {
  const ChildListPageIndividual({super.key});

  @override
  State<ChildListPageIndividual> createState() =>
      _ChildListPageIndividualState();
}

class _ChildListPageIndividualState extends State<ChildListPageIndividual> {
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(60),
              customeText(text: "Child List", size: 28),
              const Gap(20),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Image.asset(
                    "assets/leftarrow.png",
                    scale: 20,
                  )),
              customeText(text: "Toatal no : 4", size: 20, textcolor: grey600),
              const Gap(20),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Get.to(SingleChildDataIndividual());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: appThemeGrey),
                              child: ListTile(
                                leading: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: blue),
                                    height: 60,
                                    width: 60,
                                    child: Image.network(
                                      "https://s3-alpha-sig.figma.com/img/24ab/5518/d7c0717b33be2972fd5961a68ce64f6e?Expires=1702252800&Signature=QjStQLGE6H1-jL06bmiCvIkvFBY-8juw~0A6DXUHDa9nuVRduEl8r23QR66krGJZllPEQQ4eKErKkkwL1-WWXZfiI~WxpPj-9eoNPZ-OV~CV1xLgJP1p8Ot6DfgtqVyiQoTYudkaQcPi0z1ctcCsbL~evX7i1MANITbXZhdhYXVSYtSNCMxH7BUS-vWlVzAuabbLF9khL7qeDvHAr9bMTFi3d0vceL2nVsmI2m5MNGQ1lvk59an4~1vBwjzjAjeekrjiGwLvllsCGZbMDQeIf9wE7aE4QaR1BcmD4IEzDyxMZiKL0BFeBhL8YcK-L2n1zChGZ7NJBxu6olSZPR9jow__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                                      scale: 3,
                                    )),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customeText(
                                            text: "Name", textcolor: grey600),
                                        customeText(
                                            text: "Age", textcolor: grey600),
                                        customeText(
                                            text: "Gender", textcolor: grey600)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customeText(
                                            text: ":", textcolor: grey600),
                                        customeText(
                                            text: ":", textcolor: grey600),
                                        customeText(
                                            text: ":", textcolor: grey600)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customeText(
                                            text: "Sample name",
                                            textcolor: grey600),
                                        customeText(
                                            text: "6", textcolor: grey600),
                                        customeText(
                                            text: "femail", textcolor: grey600)
                                      ],
                                    )
                                  ],
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 20,
                                      color: grey600,
                                    )),
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => const Gap(20),
                      itemCount: 4))
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
}
