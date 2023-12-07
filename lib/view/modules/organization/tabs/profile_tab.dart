import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/organization/edit_organization_profile-image.dart';
import 'package:orphanagemanagement/view/modules/organization/edit_profile_details.dart';
import 'package:orphanagemanagement/view/modules/organization/settings_page.dart';

class ProfileTabOrganization extends StatefulWidget {
  ProfileTabOrganization({super.key});

  @override
  State<ProfileTabOrganization> createState() => _ProfileTabOrganizationState();
}

class _ProfileTabOrganizationState extends State<ProfileTabOrganization> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: customeText(text: "Profile", size: 26),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(SettingsPageOrganization());
            },
            icon: Image.asset("assets/Settings.png"),
          )
        ],
      ),
      body: Container(
          margin: EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  height: hight * .6,
                  width: width,
                  decoration: BoxDecoration(
                    border: GradientBoxBorder(
                        width: 2,
                        gradient: LinearGradient(
                            colors: [blue, green],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    borderRadius: BorderRadius.circular(40),
                    color: white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 30,
                          width: width * .3,
                          decoration: BoxDecoration(
                              color: appThemeGrey,
                              borderRadius: BorderRadius.circular(49)),
                          child: Center(
                            child: customeText(
                                text: "Organizatio", textcolor: blue, size: 17),
                          ),
                        ),
                      ),
                      customeText(text: "Organization Name", size: 24),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                'https://s3-alpha-sig.figma.com/img/fa20/bc06/2deb16afff00b283a126f9a481cc148d?Expires=1702252800&Signature=b9iRbTh9yLYbkE68~FSYMaDa1Lh0zzqNV-a8IKciexYYuYXp9AE5XJR93u0JQD1x9ph6AeCYAB65t7vda58fNOWEaYXU5FOH9LxGT-GfbUZKhC-6hUowW2gUnOk5AqUJnFoVB5l3XaKvnZBqhaZ7aY3N2lxcVbXi5pYWzgqIfjP5lFHPgEbhCognYoZue3tiN5vDA3iEyv3MqndDFyFsmMmwEasEzFP~DnpLP1fFULJaY3G7ioA09B~g5vBzaJXVFQH~eN-GKvminC5FKqQtu4cWRoGu7uWdKfPNX4jANk0IZJdu4PW1PFqvkayprGEI0d4j1y8Uzw1OjjeHJh179g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
                                // scale: 40,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 90),
                            child: SizedBox(
                              height: 30,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      backgroundColor: appThemeGrey),
                                  onPressed: () {
                                    Get.to(EditProfileImageOrganization());
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: black,
                                    size: 15,
                                  )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customeText(text: "Name", size: 20),
                                customeText(text: "Contact no.", size: 20),
                                customeText(text: "Email", size: 20),
                                customeText(text: "Location", size: 20),
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
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customeText(text: "name", size: 20),
                                customeText(text: "1234567899", size: 20),
                                customeText(text: "user@gmail.com", size: 20),
                                customeText(text: "sapmle loc", size: 20),
                              ],
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0, backgroundColor: appThemeGrey),
                          onPressed: () {
                            Get.to(EditProfileDetailOrganization());
                          },
                          child: customeText(
                              text: "Edit Profile", textcolor: black))
                    ],
                  ),
                ),
                Gap(20),
                Align(
                    alignment: Alignment.centerLeft,
                    child: customeText(text: "About Us", size: 25)),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  width: width,
                  height: isExpanded ? hight * .25 : hight * .1,
                  decoration: BoxDecoration(
                      color: appThemeGrey,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Details of orphanage like establishment date \n"
                        " history contributions etc and more details for users.Details of "
                        "orphanage like establishment date , history contributions etc and"
                        " more details for users.Details of orphanage like establishment date "
                        ", history contributions etc and more details for users",
                        style: GoogleFonts.jua(fontSize: 13),
                        overflow: isExpanded
                            ? TextOverflow.clip
                            : TextOverflow.ellipsis,
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: customeText(
                              text: isExpanded ? "read less" : "read more",
                              textcolor: grey600))
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
