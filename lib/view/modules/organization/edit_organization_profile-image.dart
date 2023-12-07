import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_gradient_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/easyButton.dart';

class EditProfileImageOrganization extends StatelessWidget {
  const EditProfileImageOrganization({super.key});

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: Column(children: [
          const Gap(60),
          Align(
              alignment: Alignment.topLeft,
              child: customeText(
                  text: "Profile Image", size: 24, textcolor: black)),
          const Gap(90),
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
                padding: const EdgeInsets.only(top: 95),
                child: SizedBox(
                  height: 20,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), backgroundColor: appThemeGrey),
                      onPressed: () {},
                      child: const Icon(
                        Icons.add,
                        color: black,
                        size: 20,
                      )),
                ),
              )
            ],
          ),
          Gap(50),
          InkWell(
            onTap: () {},
            child: Container(
              height: hight * .04,
              width: width * .5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: GradientBoxBorder(
                    width: 3, gradient: LinearGradient(colors: [green, blue])),
              ),
              child: Center(
                  child: customeText(
                      text: "Change Image",
                      textcolor: grey600,
                      size: 22,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          const Gap(30),
          SizedBox(
            height: hight * .04,
            width: width * .5,
            child: easyButton(
              borderColor: grey600,
              bordRadius: 50,
              bordersideWidth: 3.0,
              context: context,
              text: "Remove",
              fontWeight: FontWeight.w400,
              textcolor: grey600,
              bgColor: const MaterialStatePropertyAll(Colors.transparent),
            ),
          ),
          const Gap(120),
          SizedBox(
            height: hight * .05,
            width: width * .3,
            child: customeGradientButtom(
                onpressed: () {
                  Get.back();
                },
                context: context,
                text: "Save",
                fontWeight: FontWeight.w500,
                textcolor: white,
                bgColor: const MaterialStatePropertyAll(black)),
          ),
        ]),
      ),
    );
  }
}
