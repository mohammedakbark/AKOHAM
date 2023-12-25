import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/model/orphanage/orphn_reg_model.dart';
import 'package:orphanagemanagement/model/other_models/login_model.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/view/custome_widgets/blank_textfield.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';
import 'package:orphanagemanagement/view/modules/orphanage/main_page_orphanage.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';
import 'package:orphanagemanagement/viewmodel/login_preference.dart';

class NextSignPageOrphanage extends StatefulWidget {
  // String uid;
  TextEditingController passwordController = TextEditingController();
  TextEditingController email = TextEditingController();
  NextSignPageOrphanage(
      {super.key, required this.email, required this.passwordController});

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
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    if (isVerified == true) {
      isEmailVerified = firebaseAuths.auth.currentUser!.emailVerified;
      print(isEmailVerified);
      if (isEmailVerified == true) {
        await addorphn();

        Get.offAll(MainPageOrphanage());
        noti("Successfully Created Account");
        timer?.cancel();
      }
    }
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(20),
                customeText(
                    text: "Careconnect", size: 36, fontWeight: FontWeight.w500),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: hight * .2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "The field can't be empty";
                          } else {
                            return null;
                          }
                        },
                        controller: orphnName,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Black54)),
                          hintText: "Orphanage name",
                          hintStyle: GoogleFonts.jua(
                              color: appThemeGrey, fontSize: 20),
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "The field can't be empty";
                                } else {
                                  return null;
                                }
                              },
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
                  height: hight * .34,
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      customeText(text: "More details", size: 16),
                      const Divider(),
                      SizedBox(
                        height: hight * .3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: hight * .3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Gap(isExpand ? 50 : 35),
                                  customeText(
                                      text: "Number of Children", size: 16),
                                  // Gap(isExpand ? 50 : 35),
                                  customeText(text: "Contact no.", size: 16),
                                  // Gap(isExpand ? 50 : 35),
                                  customeText(text: "Email", size: 16),
                                  // Gap(isExpand ? 50 : 35),
                                  customeText(text: "Location", size: 16),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: hight * .3,
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Gap(isExpand ? 50 : 35),
                                  seperatorText,
                                  // Gap(isExpand ? 50 : 35),
                                  seperatorText,
                                  // Gap(isExpand ? 50 : 35),
                                  seperatorText,
                                  // Gap(isExpand ? 50 : 35),
                                  seperatorText,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: hight * .3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Gap(30),
                                  BlankTextField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "The field can't be empty";
                                        } else if (!(value.isNumericOnly)) {
                                          return "Enter the correct details";
                                        } else {
                                          return null;
                                        }
                                      },
                                      context: context,
                                      controller: numberOfChild),
                                  // Gap(35),
                                  BlankTextField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "The field can't be empty";
                                        } else if (!(value.isNumericOnly)) {
                                          return "Enter the correct mobile number";
                                        } else {
                                          return null;
                                        }
                                      },
                                      context: context,
                                      controller: contactNumber),
                                  // Gap(35),
                                  BlankTextField(
                                      enabled: false,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "The field can't be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      context: context,
                                      controller: widget.email),
                                  // Gap(13),
                                  BlankTextField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "The field can't be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      context: context,
                                      controller: location)
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: appThemeGrey,
                      borderRadius: BorderRadius.circular(13)),
                  height: hight * .35,
                  child: Column(
                    children: [
                      customeText(text: "Bank details", size: 16),
                      const Divider(
                        color: Black54,
                      ),
                      SizedBox(
                        height: 280,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 280,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customeText(text: "Bank", size: 16),
                                  customeText(text: "Account no.", size: 16),
                                  customeText(text: "E-payment no.", size: 16),
                                  customeText(text: "Contact no.", size: 16),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 280,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  seperatorText,
                                  seperatorText,
                                  seperatorText,
                                  seperatorText,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 280,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BlankTextField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "The field can't be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      context: context,
                                      controller: bank),
                                  BlankTextField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "The field can't be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      context: context,
                                      controller: accountNumber),
                                  BlankTextField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "The field can't be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      context: context,
                                      controller: epaymetNumber),
                                  BlankTextField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "The field can't be empty";
                                        } else if (!(value.isNumericOnly)) {
                                          return "Enter the correct mobile number";
                                        } else {
                                          return null;
                                        }
                                      },
                                      context: context,
                                      controller: bankContactNumber)
                                ],
                              ),
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await firebaseAuths.sign(
                            widget.email.text,
                            widget.passwordController.text,
                            context,
                          );
                          await storeInstence.addUsertoLoginTable(
                              firebaseAuths.uid,
                              LoginTable(
                                  email: widget.email.text,
                                  loginId: firebaseAuths.uid!,
                                  type: "Orphanage"));
                          await firebaseAuths.emailVarification(context);
                          setState(() {
                            isVerified = true;
                          });
                        }
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
      ),
    );
  }

  addorphn() async {
    int child = int.parse(numberOfChild.text);
    int contactnumberr = int.parse(contactNumber.text);
    int bnkContcNumbr = int.parse(bankContactNumber.text);
    await fireStore.addOrphnToFirestore(
        OrphnRegModel(
          image: "",
          loginId: firebaseAuths.uid,
          orphnName: orphnName.text,
          about: about.text,
          childCount: child,
          contactNumber: contactnumberr,
          email: widget.email.text,
          location: location.text,
        ),
        BankDetailModel(
            accountNumber: accountNumber.text,
            bank: bank.text,
            contactNumber: bnkContcNumbr,
            epaymentnumber: epaymetNumber.text));
    setLoginPrefertrue();
  }
}
