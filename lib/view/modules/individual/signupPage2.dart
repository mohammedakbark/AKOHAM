import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/model/individual/indivi_reg_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_gradient_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/modules/individual/main_page_individual.dart';
import 'package:orphanagemanagement/view/modules/individual/tabs/home_tab.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';

class NextSignPageIndividual extends StatefulWidget {
  const NextSignPageIndividual({super.key});

  @override
  State<NextSignPageIndividual> createState() => _NextSignPageIndividualState();
}

class _NextSignPageIndividualState extends State<NextSignPageIndividual> {
  FirebaseAuths firebaseAuths = FirebaseAuths();
  FireStore fireStore = FireStore();
  TextEditingController indiName = TextEditingController();

  TextEditingController contactNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController location = TextEditingController();
  bool isEmailVerified = false;
  bool isVerified = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      Get.to(MainPageIndividual(
        selectedIndex: 1,
      ));
      noti("Successfully Created Account");
      timer?.cancel();
    }
  }

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
                    controller: indiName,
                    decoration: InputDecoration(
                      labelText: "Name",
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
                    controller: email,
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
                  Gap(70),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: isVerified
                        ? const CircularProgressIndicator()
                        : customeGradientButtom(
                            onpressed: () {
                              firebaseAuths.emailVarification(context);
                              addind();
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

  addind() {
    int cntctnumbr = int.parse(contactNumber.text);

    fireStore.addIndividualToFirestore(IndivRegModel(
        name: indiName.text,
        contactNumber: cntctnumbr,
        email: email.text,
        location: location.text));
  }
}
