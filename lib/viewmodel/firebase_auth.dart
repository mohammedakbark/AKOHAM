import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:orphanagemanagement/view/modules/individual/main_page_individual.dart';
import 'package:orphanagemanagement/view/modules/individual/tabs/home_tab.dart';
import 'package:orphanagemanagement/view/modules/organization/main_page_organization.dart';
import 'package:orphanagemanagement/view/modules/orphanage/main_page_orphanage.dart';
import 'package:orphanagemanagement/view/modules/user_selection_page.dart';

class FirebaseAuths {
  FirebaseAuth auth = FirebaseAuth.instance;
  // User? user;
  UserCredential? userCredential;

  sign(
    email,
    password,
    BuildContext context,
  ) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      _showDiolog("$e", context);
    }
  }

  emailVarification(
    context,
  ) async {
    try {
      if (FirebaseAuth.instance.currentUser != null &&
          !FirebaseAuth.instance.currentUser!.emailVerified) {
        await FirebaseAuth.instance.currentUser!.sendEmailVerification().then(
            (value) => _showDiolog(
                "Varification email Send to your registered email address ${FirebaseAuth.instance.currentUser!.email} ",
                context));
      }
    } catch (e) {
      // print('Error sending verification email: $e');
      _showDiolog("$e", context);
    }
  }

  login(email, password, context, page) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => noti("Login Successful"))
          .then((value) {
        if (page == 0) {
          Get.to(() => MainPageOrphanage());
        } else if (page == 1) {
          Get.to(() => MainPageIndividual(
                selectedIndex: 1,
              ));
        } else {
          Get.to(() => MainPageOrganization(
                selectedIndex: 1,
              ));
        }
      });
    } catch (e) {
      _showDiolog("$e", context);
    }
  }
///////////////////////////////////////////////////////////////////////////////////////

  Future signWithGoogle(context, page) async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? gAuth = await gUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth?.accessToken, idToken: gAuth?.idToken);
      return await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => noti(
                "Google sign successful",
              ))
          .then((value) {
        if (page == 1) {
          Get.offAll(() => MainPageIndividual(
                selectedIndex: 1,
              ));
        } else if (page == 2) {
          Get.offAll(() => MainPageOrganization(
                selectedIndex: 1,
              ));
        }
      });
    } catch (e) {
      return _showDiolog("$e", context);
    }
  }

  Future signInWithFacebook(context, page) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      return FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          .then((value) => noti(
                "Facebook sign successful",
              ))
          .then((value) {
        if (page == 1) {
          Get.offAll(() => MainPageIndividual(
                selectedIndex: 1,
              ));
        } else if (page == 2) {
          Get.offAll(() => MainPageOrganization(
                selectedIndex: 1,
              ));
        }
      });
    } catch (e) {
      return _showDiolog("$e", context);
    }
  }

  ///////////////////SIGNOUT//////////////////////////////////////
  ///
  ///

  void signOut(
    context,
  ) {
    signOutFromMAil(context);
    signoutFromGoogle(
      context,
    );
    Get.offAll(const UserSelectionPageIndividualAndOrganization());
  }
/////////////////////////////////////////////
  void signOutFromMAil(context) {
    FirebaseAuth.instance.signOut();
  }

  void signoutFromGoogle(context) {
    GoogleSignIn().signOut();
  }

  _showDiolog(String title, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        content: Text(title),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"))
        ],
      ),
    );
  }
}

void noti(msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey.shade200,
    textColor: Colors.black,
    fontSize: 20.0,
  );
}
