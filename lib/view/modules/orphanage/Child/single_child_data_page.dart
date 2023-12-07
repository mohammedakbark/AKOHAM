
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';

class SingleChildDataOrphanage extends StatelessWidget {
  SingleChildDataOrphanage({super.key});

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Child Details"),
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
                  width: width * .28,
                  height: hight * .1,
                  child: Image.network(
                    "https://s3-alpha-sig.figma.com/img/24ab/5518/d7c0717b33be2972fd5961a68ce64f6e?Expires=1702252800&Signature=QjStQLGE6H1-jL06bmiCvIkvFBY-8juw~0A6DXUHDa9nuVRduEl8r23QR66krGJZllPEQQ4eKErKkkwL1-WWXZfiI~WxpPj-9eoNPZ-OV~CV1xLgJP1p8Ot6DfgtqVyiQoTYudkaQcPi0z1ctcCsbL~evX7i1MANITbXZhdhYXVSYtSNCMxH7BUS-vWlVzAuabbLF9khL7qeDvHAr9bMTFi3d0vceL2nVsmI2m5MNGQ1lvk59an4~1vBwjzjAjeekrjiGwLvllsCGZbMDQeIf9wE7aE4QaR1BcmD4IEzDyxMZiKL0BFeBhL8YcK-L2n1zChGZ7NJBxu6olSZPR9jow__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                    scale: 1.5,
                  ),
                ),
              ),
              Gap(4),
              customeText(
                  text: "(photo optional)", textcolor: appThemeGrey, size: 12),
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
                            // SizedBox(
                            //   height: 200,
                            //   child: ListTile(
                            //     title:
                            //         customeText(text: "Birth Date", size: 16),
                            //     subtitle: customeText(
                            //         text: "(maybe not accurate )", size: 16),
                            //   ),
                            // ),
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
              Gap(20),
              Container(
                margin: EdgeInsets.all(2),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //       offset: Offset.infinite,
                    //       blurStyle: BlurStyle.outer,
                    //       color: Colors.black,
                    //       blurRadius: 2,
                    //       spreadRadius: .1),
                    //   BoxShadow(
                    //       color: const Color.fromARGB(255, 239, 239, 239),
                    //       blurRadius: 2,
                    //       spreadRadius: .1)
                    // ],
                    color: appThemeGrey,
                    borderRadius: BorderRadius.circular(13)),
                height: hight * .36,
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
              // Gap(20),
              // SizedBox(
              //   width: width * .45,
              //   height: hight * .05,
              //   child: ElevatedButton(
              //       onPressed: () {
              //         Get.to(EditChildDetailPageOrphanage());
              //       },
              //       style: ButtonStyle(
              //         backgroundColor: MaterialStatePropertyAll(appThemeGrey),
              //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10))),
              //       ),
              //       child: Row(
              //         children: [
              //           Image.network(
              //             "https://s3-alpha-sig.figma.com/img/4961/702b/b25b6f3e8359df1d590d65d7ea1a1366?Expires=1702252800&Signature=LBR1xy7WHkWPFnXHMqhaVWgQjn~wLlnaW4wKpynsQQklzpAq~GDaFCRx7BDYl0gcZQNLnGSDT8-tNrZLYAEpkAj~IQ9JVwtdu2gMnjcOB2fypJlX0QysTXJQZbe6lOD80RX8PPWNn~Ke~FCqtqfYr-Rd~hLAqKo4b1CJqgpZQUtPFUutzaUvF7IW-eICfDnZeE~cGW6rLwzUvkf91ZDUdxz2r~H8m3EVO6L8VgoDplA6zM6wd4CShnBCmUfEtXjde22kNPzpU7hXbU7T0h7I~i1U0B43XpzAKUl0U9QOq0qp3w9lDgUwTOlO9E1VmDbERTUQshB~uKV824voE17Qkg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
              //             scale: 3,
              //           ),
              //           customeText(
              //               text: "Edit/Update", textcolor: grey600, size: 20),
              //         ],
              //       )),
              // ),
              // Gap(20),
              // SizedBox(
              //   width: width * .5,
              //   height: hight * .05,
              //   child: OutlinedButton(
              //       onPressed: () {},
              //       style: ButtonStyle(
              //           shape: MaterialStateProperty.all(RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10.0))),
              //           side: MaterialStatePropertyAll(
              //               BorderSide(color: Colors.red))),
              //       child: customeText(
              //           text: "Remove Child", textcolor: Colors.red)),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
