import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_gradient_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/organization/main_page_organization.dart';


class SingleChildDataOrganization extends StatefulWidget {
  SingleChildDataOrganization({super.key});

  @override
  State<SingleChildDataOrganization> createState() => _SingleChildDataOrganizationState();
}

class _SingleChildDataOrganizationState extends State<SingleChildDataOrganization> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(60),
              Align(
                  alignment: Alignment.topLeft,
                  child: customeText(text: "Child Details", size: 28)),
              const Gap(20),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Image.asset(
                      "assets/leftarrow.png",
                      scale: 20,
                    )),
              ),
              const Gap(20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: blue,
                  width: width * .28,
                  height: hight * .1,
                  child: Image.network(
                    "https://s3-alpha-sig.figma.com/img/24ab/5518/d7c0717b33be2972fd5961a68ce64f6e?Expires=1702252800&Signature=QjStQLGE6H1-jL06bmiCvIkvFBY-8juw~0A6DXUHDa9nuVRduEl8r23QR66krGJZllPEQQ4eKErKkkwL1-WWXZfiI~WxpPj-9eoNPZ-OV~CV1xLgJP1p8Ot6DfgtqVyiQoTYudkaQcPi0z1ctcCsbL~evX7i1MANITbXZhdhYXVSYtSNCMxH7BUS-vWlVzAuabbLF9khL7qeDvHAr9bMTFi3d0vceL2nVsmI2m5MNGQ1lvk59an4~1vBwjzjAjeekrjiGwLvllsCGZbMDQeIf9wE7aE4QaR1BcmD4IEzDyxMZiKL0BFeBhL8YcK-L2n1zChGZ7NJBxu6olSZPR9jow__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                    scale: 1.5,
                  ),
                ),
              ),
              Gap(4),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 480,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customeText(
                              text: "Name",
                              size: 20,
                            ),
                            customeText(text: "Nick Name.", size: 20),
                            customeText(text: "Age", size: 20),
                            customeText(text: "Gender", size: 20),
                            customeText(text: "Birth Date", size: 20),
                            customeText(text: "Joined Date", size: 20),
                            customeText(text: "Known location", size: 20),
                            customeText(text: "Bkood Group", size: 20),
                            customeText(text: "Orphan Type", size: 20),
                            customeText(text: "Ready For Adoption", size: 20),
                          ],
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            seperatorText,
                            seperatorText,
                            seperatorText,
                            seperatorText,
                            seperatorText,
                            seperatorText,
                            seperatorText,
                            seperatorText,
                            seperatorText,
                            seperatorText,
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlankTextField(
                              context: context,
                              hintText: "sample anme",
                            ),
                            BlankTextField(
                                context: context, hintText: "Sample Nick Name"),
                            BlankTextField(
                                context: context, hintText: "5 Years"),
                            BlankTextField(context: context, hintText: "Male"),
                            BlankTextField(
                                context: context, hintText: "22/12/2017"),
                            BlankTextField(
                                context: context, hintText: "02/08/2020"),
                            BlankTextField(
                                context: context, hintText: "Malappuram"),
                            BlankTextField(context: context, hintText: "O +ve"),
                            BlankTextField(
                                context: context, hintText: "Double orphan"),
                            BlankTextField(
                                context: context, hintText: "Ready for adopt"),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(40),
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: appThemeGrey,
                    borderRadius: BorderRadius.circular(13)),
                height: hight * .38,
                child: Column(
                  children: [
                    const Gap(15),
                    customeText(text: "Health Report", size: 17),
                    const Divider(
                      color: Black54,
                    ),
                    SizedBox(
                      height: 290,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customeText(text: "Medical Status", size: 20),
                              customeText(text: "Diseases", size: 20),
                              customeText(text: "Disabilities", size: 20),
                              customeText(text: "Hight", size: 20),
                              customeText(text: "Weight", size: 20),
                              customeText(text: "Medicines", size: 20),
                            ],
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              seperatorText,
                              seperatorText,
                              seperatorText,
                              seperatorText,
                              seperatorText,
                              seperatorText,
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              BlankTextField(
                                  context: context, hintText: "Good"),
                              BlankTextField(
                                  context: context, hintText: "None"),
                              BlankTextField(
                                  context: context, hintText: "None"),
                              BlankTextField(
                                  context: context, hintText: "108.2"),
                              BlankTextField(
                                  context: context, hintText: "18 kg"),
                              BlankTextField(
                                  context: context, hintText: "None"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(40),
              customeGradientButtom(
                  onpressed: () {
                    // Get.to(MainTabIndividual());
                  },
                  context: context,
                  text: "Request Adoption",
                  fontWeight: FontWeight.w400,
                  textcolor: white,
                  bgColor: const MaterialStatePropertyAll(black)),
              Gap(40),
              customeText(text: "Send a request for adoption of this child")
            ],
          ),
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          
          onTap: (index) {
            setState(() {
              if (index == 0) {
                Get.to(MainPageOrganization(selectedIndex: 0));
              } else if (index == 1) {
                Get.to(MainPageOrganization(selectedIndex: 1));
              } else {
                Get.to(MainPageOrganization(selectedIndex: 2));
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
        )
    );
  }
}
