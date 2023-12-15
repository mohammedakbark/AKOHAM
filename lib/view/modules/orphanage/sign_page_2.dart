import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/model/orphanage/orphn_reg_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';
import 'package:orphanagemanagement/view/modules/orphanage/main_page_orphanage.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';

class NextSignPageOrphanage extends StatefulWidget {
  String uid;
   TextEditingController email = TextEditingController();
  NextSignPageOrphanage({
    super.key,
    required this.email,
    required this.uid
  });

  @override
  State<NextSignPageOrphanage> createState() => _NextSignPageOrphanageState();
}

class _NextSignPageOrphanageState extends State<NextSignPageOrphanage> {
  FireStore fireStore = FireStore();

  TextEditingController orphnName = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController numberOfChild = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
 
  TextEditingController location = TextEditingController();
  TextEditingController bank = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController epaymetNumber = TextEditingController();
  TextEditingController bankContactNumber = TextEditingController();

  FirebaseAuths firebaseAuths = FirebaseAuths();
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
  //     Get.to(MainPageOrphanage());
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
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(20),
              customeText(
                  text: "Careconnect", size: 36, fontWeight: FontWeight.w500),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: hight * .18,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      controller: orphnName,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Black54)),
                        hintText: "Orphanage name",
                        hintStyle:
                            GoogleFonts.jua(color: appThemeGrey, fontSize: 20),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customeText(
                          text: "About",
                          size: 16,
                        ),
                        customeTextField(
                            hintText: "type here",
                            radius: 10,
                            controller: about),
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
                              Text(
                                ":",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlankTextField(
                                  context: context, controller: numberOfChild),
                              BlankTextField(
                                  context: context, controller: contactNumber),
                              BlankTextField(
                                  context: context, controller:widget. email),
                              BlankTextField(
                                  context: context, controller: location)
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
                              Text(
                                ":",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                ":",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlankTextField(
                                  context: context, controller: bank),
                              BlankTextField(
                                  context: context, controller: accountNumber),
                              BlankTextField(
                                  context: context, controller: epaymetNumber),
                              BlankTextField(
                                  context: context,
                                  controller: bankContactNumber)
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
                    onPressed: () async{
                   await   addorphn();
                      // firebaseAuths.emailVarification(context);
                      // Get.to(() => MainPageOrphanage());

                      setState(() {
                        isVerified = true;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(black),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    child: isVerified
                        ? const CircularProgressIndicator()
                        : customeText(
                            text: "Sign up", textcolor: white, size: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addorphn()async {
    int child = int.parse(numberOfChild.text);
    int contactnumberr = int.parse(contactNumber.text);
    int bnkContcNumbr = int.parse(bankContactNumber.text);
  await  fireStore.addOrphnToFirestore(
        OrphnRegModel(
            image: "",
          loginId: widget.uid,
          orphnName: orphnName.text,
          about: about.text,
          childCount: child,
          contactNumber: contactnumberr,
          email:widget. email.text,
          location: location.text,
        ),
        BankDetailModel(
          accountNumber: accountNumber.text,
            bank: bank.text,
            contactNumber: bnkContcNumbr,
            epaymentnumber: epaymetNumber.text));
  }
}
