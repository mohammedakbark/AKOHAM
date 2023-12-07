import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/individual/edit_profile_details.dart';
import 'package:orphanagemanagement/view/modules/individual/edit_Individual_rofile-image.dart';
import 'package:orphanagemanagement/view/modules/individual/settings_page.dart';
import 'package:orphanagemanagement/view/modules/individual/signup_page.dart';

class ProfileTabIndividual extends StatelessWidget {
  const ProfileTabIndividual({super.key});

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
              Get.to(SettingsPageIndividual());
            },
            icon: Image.asset("assets/Settings.png"),
          )
        ],
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              height: hight * .6,
              width: width,
              margin: EdgeInsets.all(20),
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
                  customeText(text: "User123", size: 24),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          "https://s3-alpha-sig.figma.com/img/5e3c/9e81/dd1b5781039c3179b5aad0001c25a54b?Expires=1702252800&Signature=hZ5KJu0eZ4pNig074kx4O9D2K7AHs1r1jWnsauWxxAPJNse5TBhhsEL9~Lce5CP0zyd-1vTQ1oR0ELbGZGn9HYKP1oz9uvzMFOog6Tyb8UTgZ0ya2BI1mJb87D-TpaURrMVOTKTcnI7yFetaZ30lri-YPpKuR6pNARXKzfTf-WNVwtRHVcO-pLUnoDsE1J306DTaO3xQK15Axw2TwOFcxLv7D75tnqzBarluaXj-40VS6uUxreU-8WrP~Isi8qOl34NZ0uhU1Nj6jmfyVghOoPPb0~cLgm8X~38Zl0yu~D6epR6~~ki~tJ9028PqtYotyEHpGMZ5C96FnMN-b7KeDA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                          scale: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: SizedBox(
                          height: 30,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  backgroundColor: appThemeGrey),
                              onPressed: () {
                                Get.to(EditProfileImageIndividual());
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
                        Get.to(EditProfileDetailIndividual());
                      },
                      child:
                          customeText(text: "Edit Profile", textcolor: black))
                ],
              ),
            ),
          )),
    );
  }
}
