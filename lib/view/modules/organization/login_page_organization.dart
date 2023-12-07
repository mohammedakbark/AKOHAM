import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:orphanagemanagement/utils/colors.dart';
import 'package:orphanagemanagement/view/custome_widgets/custom_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_gradient_button.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_text.dart';
import 'package:orphanagemanagement/view/custome_widgets/custome_textfield.dart';

import 'package:orphanagemanagement/view/modules/organization/main_page_organization.dart';
import 'package:orphanagemanagement/view/modules/organization/signup_page.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';

class LoginPageOrganization extends StatelessWidget {
  LoginPageOrganization({super.key});
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuths firebaseAuths = FirebaseAuths();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.red,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(50),
                customeText(
                    text: "Careconnect", size: 36, fontWeight: FontWeight.w500),
                Image.network(
                  "https://s3-alpha-sig.figma.com/img/7ec5/8713/8d552574e82e442581e0092cd66c9003?Expires=1702252800&Signature=nIeVjXt4zIqOCCRuSHpIX9t1RRDZMthhCWCD2HnPcGuu-b2RGCpmEOaebSh1YhSyvcoqm4yAjq9WGnj493vqpF~nHnUH8xAskKt5jTidDT3F7fqr0EoMOKwJrREu~IPpBeEeiqykt0M1Y-rhMXCX4OKcTNuvGzO~fvqx~md3uSLJ8RDf765CWmhhZ-KADGtVA3pt3G21bzZavncEEZfN7havdrIi6CbataKR7xNwtVSbMEh4CG2M~Sogkr6crPPBW2gacx9dwiZceEN75YiM~nTdrr1Ft1Oc8iNRqmFBfsErFKoivAHu76dbh4jFut9mHk38hqEi5~Gf~4-DnMHy3g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  scale: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customeTextField(
                          hintText: "Your Email Id",
                          radius: 30,
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Registerd Email Id";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return "Enter Correct Email Address";
                            }
                            return null;
                          }),
                      customeTextField(
                          hintText: "Password",
                          radius: 30,
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Password";
                            }
                            return null;
                          }),
                    ],
                  ),
                ),
                Gap(100),
                customeGradientButtom(
                    onpressed: () {
                      if (_formKey.currentState!.validate()) {
                        firebaseAuths.login(emailController.text,
                            passwordController.text, context, 2);
                      }
                    },
                    context: context,
                    text: "Login",
                    textcolor: white,
                    bgColor: const MaterialStatePropertyAll(black)),
                Gap(60),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customeText(
                        text: "Don't have an account ?",
                        size: 14,
                        fontWeight: FontWeight.w600),
                    customeButton(
                        bordersideWidth: 1.5,
                        onpressed: () {
                          Get.to(SignPageOrganization());
                        },
                        context: context,
                        text: "Sign Up",
                        textcolor: black,
                        bgColor: white)
                  ],
                ),
                Gap(20),
                customeText(text: "Or login using"),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                             firebaseAuths.signWithGoogle(context, 2);
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
                         firebaseAuths.signInWithFacebook(context, 2);
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
