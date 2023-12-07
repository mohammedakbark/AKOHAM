import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/individual/login_page_Individual.dart';
import 'package:orphanagemanagement/view/modules/organization/login_page_organization.dart';
import 'package:orphanagemanagement/view/modules/orphanage/login_page.dart';

class UserSelectionPageIndividualAndOrganization extends StatelessWidget {
  const UserSelectionPageIndividualAndOrganization({super.key});

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(children: [
            Gap(100),
            customeText(
                text: "Careconnect", size: 36, fontWeight: FontWeight.w500),
            Gap(30),
            SizedBox(
              height: 300,
              child: Image.network(
                "https://s3-alpha-sig.figma.com/img/fd32/aa9e/9a73b18a8017938fdd66c3e2e3d95c1a?Expires=1702252800&Signature=CyikI4kOEuOioODvgcz~boLi-JzqJjPkwOlvF5mkhD0LbepXFLex6kuk03Vy4CufNbYZJ38MgTshPjIHWttskq3BW6WYe3f-eHtw4ZzjMpyhWbmo67GBtMcc1z1PWYJS4qepGN75tKH6knXLnzsdxi2clKu4bfpZlyrbeol5BpLxT8SvLyMzmyzA7eG7TY4-COVTQC4B4~3eNnlROP1y6UbPzf1H-sTwK1Xn4hvPpib3H0aG0o62JVOtveIRz0xUXIxq3ZXVyqhRC4nDiNOe29goxl71QiS3w-0hxKd1cVATK8HxzdnAsJhhhpZy6lA1eaZmunr~xmRCICrDp-T6-g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                scale: 7,
              ),
            ),
            Gap(20),
            Align(
                alignment: Alignment.centerLeft,
                child: customeText(
                    text: "Select login type", textcolor: grey600, size: 17)),
            const Gap(30),
            InkWell(
              onTap: () {
                Get.to(LoginPageIndividual());
              },
              child: Container(
                height: hight * .05,
                width: width * .7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: GradientBoxBorder(
                      width: 1.5,
                      gradient: LinearGradient(colors: [green, blue])),
                ),
                child: Center(
                    child: customeText(
                        text: "User",
                        textcolor: grey600,
                        size: 22,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            const Gap(30),
            InkWell(
              onTap: () {
                Get.to(LoginPageOrganization());
              },
              child: Container(
                height: hight * .05,
                width: width * .7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: GradientBoxBorder(
                      width: 1.5,
                      gradient: LinearGradient(colors: [green, blue])),
                ),
                child: Center(
                    child: customeText(
                        text: "Organization",
                        textcolor: grey600,
                        size: 22,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Gap(180),
            // Expanded(child: SizedBox()),
            TextButton(
                onPressed: () {
                  Get.to(LoginPageOrphanage());
                },
                child: Text(
                  "Return to admin login",
                  style: GoogleFonts.jua(
                    fontSize: 18,
                    color: black,
                    decoration: TextDecoration.underline,
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
