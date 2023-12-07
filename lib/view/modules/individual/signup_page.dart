import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custom_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_gradient_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';
import 'package:orphanagemanagement/view/modules/individual/login_page_Individual.dart';
import 'package:orphanagemanagement/view/modules/individual/signupPage2.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';

class SignPageIndividual extends StatelessWidget {
  SignPageIndividual({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController userNameController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  FirebaseAuths firebaseAuths = FirebaseAuths();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(30),
                customeText(
                    text: "Careconnect", size: 36, fontWeight: FontWeight.w500),
                Image.network(
                  "https://s3-alpha-sig.figma.com/img/7dcb/500f/3e806c800ca3f6ed0f875958a0bccd24?Expires=1702252800&Signature=UhFWjqX2otME3Zbo5vshbtkNPSbauxkg8lfAKQOB9MRuVO4ljf-zkDeadSLV8QiAFcXpD61ACYk1rcnt-eKBb2HOdA1t05xfkUZML2A-4XYzbi3GxAuMd64W2qTOAcghB2rD7glYqVGxnPVtBLhOAR~NeATYTp84e043sChLXKqPlgShEkGNUazhPQOq1zdkrBIFLe9FQ~3af~t4vBMKpYwB8omJA-Mqk2qmOFfZ105XW35Us3w8U315Ey5esxSVlIia5SOiBrd0-bbeq~EI8CAiZudh5ikhDsYkjhdjm3stdeua3g8KROQfFFnh4Cy263sujOpZx8LsHYUP8Ehs7Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  scale: 10,
                ),
                Gap(20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height * .45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customeTextField(
                          hintText: "Your Email Id",
                          radius: 30,
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Email Id";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return "Enter Correct Email Address";
                            }
                            return null;
                          }),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customeText(
                              text: "Create username", textcolor: appThemeGrey),
                          customeTextField(
                              hintText: "Username",
                              radius: 30,
                              controller: userNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Your Username Id";
                                }
                                return null;
                              }),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customeText(
                              text: "Create password", textcolor: appThemeGrey),
                          customeTextField(
                              hintText: "Password",
                              radius: 30,
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter a Password";
                                }
                                if (value.length < 6) {
                                  return "Password Should Minimum 6 Digit";
                                }
                                return null;
                              }),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customeText(
                              text: "Re-enter password",
                              textcolor: appThemeGrey),
                          customeTextField(
                              hintText: "Password",
                              radius: 30,
                              controller: rePasswordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Confirm Your Password";
                                }
                                if (passwordController.text !=
                                    rePasswordController.text) {
                                  return "Enter Correct  Password";
                                }
                                return null;
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(30),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: customeGradientButtom(
                    onpressed: () {
                      if (_formKey.currentState!.validate()) {
                        firebaseAuths.sign(
                          emailController.text,
                          passwordController.text,
                          context,
                        );
                        Get.to(NextSignPageIndividual());
                      }
                    },
                    context: context,
                    text: "Next",
                    textcolor: white,
                  ),
                ),
                Gap(20),
                customeText(text: "Or creat using"),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        firebaseAuths.signWithGoogle(context, 1);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: grey600!),
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Image.asset(
                            "assets/ggogle.png",
                            scale: 15,
                          ),
                        ),
                      ),
                    ),
                    Gap(10),
                    InkWell(
                      onTap: () {
                        firebaseAuths.signInWithFacebook(context, 1);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: grey600!),
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Image.asset(
                            "assets/facebook.png",
                            scale: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customeText(
                        text: "Already have an account ?",
                        size: 14,
                        fontWeight: FontWeight.w600),
                    Gap(5),
                    customeButton(
                        onpressed: () {
                          Get.to(LoginPageIndividual());
                        },
                        bordersideWidth: 2,
                        context: context,
                        text: "Login",
                        textcolor: black,
                        bgColor: white)
                  ],
                ),
                Gap(20),
                TextButton(
                    onPressed: () {
                      //to do termsa and condition..
                    },
                    child: Text(
                      "Terms & Conditions ",
                      style: GoogleFonts.jua(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: black,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
