import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_gradient_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/easyButton.dart';

class EditProfileImageIndividual extends StatelessWidget {
  const EditProfileImageIndividual({super.key});

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
                child: Image.network(
                  "https://s3-alpha-sig.figma.com/img/5e3c/9e81/dd1b5781039c3179b5aad0001c25a54b?Expires=1702252800&Signature=hZ5KJu0eZ4pNig074kx4O9D2K7AHs1r1jWnsauWxxAPJNse5TBhhsEL9~Lce5CP0zyd-1vTQ1oR0ELbGZGn9HYKP1oz9uvzMFOog6Tyb8UTgZ0ya2BI1mJb87D-TpaURrMVOTKTcnI7yFetaZ30lri-YPpKuR6pNARXKzfTf-WNVwtRHVcO-pLUnoDsE1J306DTaO3xQK15Axw2TwOFcxLv7D75tnqzBarluaXj-40VS6uUxreU-8WrP~Isi8qOl34NZ0uhU1Nj6jmfyVghOoPPb0~cLgm8X~38Zl0yu~D6epR6~~ki~tJ9028PqtYotyEHpGMZ5C96FnMN-b7KeDA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  scale: 30,
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
