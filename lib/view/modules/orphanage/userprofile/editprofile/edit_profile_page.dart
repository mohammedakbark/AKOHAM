
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';

class EditProfileOrphanage extends StatefulWidget {
  const EditProfileOrphanage({super.key});

  @override
  State<EditProfileOrphanage> createState() => _EditProfileOrphanageState();
}

class _EditProfileOrphanageState extends State<EditProfileOrphanage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: customeText(text: "Edit Profile"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: hight * .18,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Black54)),
                        hintText: "Orphanage name",
                        hintStyle:
                            GoogleFonts.jua(color: grey600, fontSize: 20),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customeText(text: "About", size: 16),
                        customeTextField(hintText: "Type here..", radius: 10),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: hight * .27,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Gap(5),
                    customeText(text: "More details", size: 16),
                    const Divider(),
                    SizedBox(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customeText(text: "Number of Children", size: 16),
                              customeText(text: "Contact no.", size: 16),
                              customeText(text: "Email", size: 16),
                              customeText(text: "Location", size: 16),
                            ],
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             seperatorText,
                             seperatorText,
                             seperatorText,seperatorText,
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlankTextField(
                                context: context,
                              ),
                              BlankTextField(context: context),
                              BlankTextField(context: context),
                              BlankTextField(context: context)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: appThemeGrey,
                    borderRadius: BorderRadius.circular(13)),
                height: hight * .27,
                child: Column(
                  children: [
                    Gap(5),
                    customeText(text: "Bank details", size: 16),
                    const Divider(
                      color: Black54,
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
                              customeText(text: "Bank", size: 16),
                              customeText(text: "Account no.", size: 16),
                              customeText(text: "E-payment no.", size: 16),
                              customeText(text: "Contact no.", size: 16),
                            ],
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             seperatorText,seperatorText,seperatorText,seperatorText,
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlankTextField(
                                context: context,
                              ),
                              BlankTextField(context: context),
                              BlankTextField(context: context),
                              BlankTextField(context: context)
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
                height: hight * .05,
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


