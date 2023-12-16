import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/model/organization/orgna_reg_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_gradient_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';

import 'package:orphanagemanagement/view/modules/organization/main_page_organization.dart';
import 'package:orphanagemanagement/view/modules/orphanage/main_page_orphanage.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';

class NextSignPageOrganization extends StatefulWidget {
  TextEditingController email = TextEditingController();
  String? uid;
  NextSignPageOrganization({super.key, required this.email, required this.uid});

  @override
  State<NextSignPageOrganization> createState() =>
      _NextSignPageOrganizationState();
}

class _NextSignPageOrganizationState extends State<NextSignPageOrganization> {
  FirebaseAuths firebaseAuths = FirebaseAuths();
  FireStore fireStore = FireStore();
  TextEditingController orgName = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController contactNumber = TextEditingController();

  TextEditingController location = TextEditingController();

  bool isEmailVerified = false;
  bool isVerified = false;
  Timer? timer;
  // @override
  // void initState() {
  //   super.initState();
  //   timer =
  //       Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  // }

  // checkEmailVerified() async {
  //   await FirebaseAuth.instance.currentUser?.reload();
  //   setState(() {
  //     isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  //   });
  //   if (isEmailVerified) {
  //     Get.to(MainPageOrganization(
  //       selectedIndex: 1,
  //     ));
  //     noti("Successfully Created Account");
  //     timer?.cancel();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(20),
        height: hight,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(70),
              customeText(
                  text: "Register", size: 25, fontWeight: FontWeight.w500),
              Gap(50),
              Column(
                children: [
                  TextFormField(
                    controller: orgName,
                    decoration: InputDecoration(
                      labelText: "Organization Nmae",
                      labelStyle: GoogleFonts.jua(color: black),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Black54)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Black54)),
                      hintStyle:
                          GoogleFonts.jua(color: appThemeGrey, fontSize: 20),
                    ),
                  ),
                  Gap(40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customeText(text: "Contact No", size: 16),
                      TextFormField(
                        controller: contactNumber,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Black54)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Black54)),
                        ),
                      ),
                    ],
                  ),
                  Gap(50),
                  TextFormField(
                    controller: widget.email,
                    decoration: InputDecoration(
                      labelText: "Email",
                      suffix: customeText(text: ".com", textcolor: grey600),
                      labelStyle: GoogleFonts.jua(color: black),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Black54)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Black54)),
                      hintStyle:
                          GoogleFonts.jua(color: appThemeGrey, fontSize: 20),
                    ),
                  ),
                  Gap(40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customeText(text: "Location", size: 16),
                      TextFormField(
                        controller: location,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Black54)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Black54)),
                        ),
                      ),
                    ],
                  ),
                  Gap(20),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: customeText(text: "About", size: 16)),
                  customeTextField(
                      radius: 10, hintText: "Type here", controller: about),
                  Gap(50),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: isVerified
                        ? const CircularProgressIndicator()
                        : customeGradientButtom(
                            onpressed: () {
                              firebaseAuths.emailVarification(context);
                              addorg();

                              setState(() {
                                isVerified = true;
                              });
                            },
                            context: context,
                            text: "Sign Up",
                            textcolor: white,
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  addorg() {
    int conNumbr = int.parse(contactNumber.text);

    fireStore.addOrganizationToFirestore(OrgnRegModel(
        image: "",
        loginId: widget.uid,
        orgName: orgName.text,
        contactNumber: conNumbr,
        email: widget.email.text,
        location: location.text,
        about: about.text));
  }
}
