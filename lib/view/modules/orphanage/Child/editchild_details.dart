import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';

class EditChildDetailPageOrphanage extends StatelessWidget {
  EditChildDetailPageOrphanage({super.key});

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Orientation orientation = MediaQuery.of(context).orientation;
    const landScapeMode = Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Edit Child Details"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: appThemeGrey,
                  width:
                      orientation == landScapeMode ? width * .20 : width * .28,
                  height:
                      orientation == landScapeMode ? hight * .25 : hight * .1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        "https://s3-alpha-sig.figma.com/img/24ab/5518/d7c0717b33be2972fd5961a68ce64f6e?Expires=1702252800&Signature=QjStQLGE6H1-jL06bmiCvIkvFBY-8juw~0A6DXUHDa9nuVRduEl8r23QR66krGJZllPEQQ4eKErKkkwL1-WWXZfiI~WxpPj-9eoNPZ-OV~CV1xLgJP1p8Ot6DfgtqVyiQoTYudkaQcPi0z1ctcCsbL~evX7i1MANITbXZhdhYXVSYtSNCMxH7BUS-vWlVzAuabbLF9khL7qeDvHAr9bMTFi3d0vceL2nVsmI2m5MNGQ1lvk59an4~1vBwjzjAjeekrjiGwLvllsCGZbMDQeIf9wE7aE4QaR1BcmD4IEzDyxMZiKL0BFeBhL8YcK-L2n1zChGZ7NJBxu6olSZPR9jow__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                        scale: 1.5,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: black,
                            ),
                            width: width * .28,
                            height: orientation == landScapeMode
                                ? hight * .05
                                : hight * .03,
                            child: Center(
                              child: customeText(
                                  text: "Remove/Change", textcolor: white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
                            customeText(text: "Name", size: 16),
                            customeText(text: "Nick Name.", size: 16),
                            customeText(text: "Age", size: 16),
                            customeText(text: "Gender", size: 16),
                            customeText(text: "Birth Date", size: 16),
                            customeText(text: "Joined Date", size: 16),
                            customeText(text: "Known location", size: 16),
                            customeText(text: "Bkood Group", size: 16),
                            customeText(text: "Orphan Type", size: 16),
                            customeText(text: "Ready For Adoption", size: 16),
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
                                context: context, hintText: "sample anme"),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: appThemeGrey,
                    borderRadius: BorderRadius.circular(13)),
                height: orientation == landScapeMode ? hight * .8 : hight * .36,
                child: Column(
                  children: [
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
                              customeText(text: "Medical Status", size: 16),
                              customeText(text: "Diseases", size: 16),
                              customeText(text: "Disabilities", size: 16),
                              customeText(text: "Hight", size: 16),
                              customeText(text: "Weight", size: 16),
                              customeText(text: "Medicines", size: 16),
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
              Gap(20),
              SizedBox(
                width: width * .45,
                height:
                    orientation == landScapeMode ? hight * .08 : hight * .05,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(black),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  child: customeText(text: "Save", textcolor: white, size: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
