// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orphanagemanagement/model/orphanage/orphn_reg_model.dart';
import 'package:orphanagemanagement/model/other_models/adoption_model.dart';
import 'package:orphanagemanagement/model/other_models/donation_accepted_model.dart';
import 'package:orphanagemanagement/model/other_models/help_request_model.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';

class ServiceProvider with ChangeNotifier {
  List<HelpRequestModel> helpReqList = [];
  HelpRequestModel? helpRequestModel;
  List<AdoptionModel> adoptionReqList = [];
  AdoptionModel? adoptionModel;
  List<DonationAcceptedmodel> donationAcceptenceList = [];
  DonationAcceptedmodel? donationAcceptedmodel;
  ////////////////////////////request/////////////////
  sendNewNotificationToUsers(HelpRequestModel helpRequestModel, context) {
    try {
      final notificationCollection = db.collection("Help Request");
      final docs = notificationCollection.doc();
      docs.set(helpRequestModel.toJson(docs.id));
      print(
          "-------------------help request sended by orphanage ---------------");
    } catch (e) {
      return customeShowDiolog("$e", context);
    }
  }

  fetchAllHelpRequest(context) async {
    try {
      QuerySnapshot<Map<String, dynamic>> notificationSnapshot =
          await db.collection("Help Request").get();

      helpReqList = notificationSnapshot.docs.map((doc) {
        return HelpRequestModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      print("-------------------help requuest fetched ---------------");
      print(helpReqList.length);
      notifyListeners();
    } catch (e) {
      return customeShowDiolog("$e", context);
    }
  }

////////////////////////////////adoption request////////////////////////////
  addAdoptionRequestToFirebase(AdoptionModel adoptionModel, context) async {
    try {
      final adoptionRequestCollection = db.collection("Adoption Request");
      final docs = adoptionRequestCollection.doc();
      docs.set(adoptionModel.toJson(docs.id));
      print("----------------Adoption Request sended-------------");
    } catch (e) {
      return customeShowDiolog("$e", context);
    }
  }

  fetchAllAdoptionRequests(context) async {
    try {
      QuerySnapshot<Map<String, dynamic>> adoptionSnapshot =
          await db.collection("Adoption Request").get();

      adoptionReqList = adoptionSnapshot.docs.map((doc) {
        return AdoptionModel.fromJson(doc.data());
      }).toList();
      print("-------------------adoption requuest fetched ---------------");
      print(helpReqList.length);
      notifyListeners();
    } catch (e) {
      return customeShowDiolog("$e", context);
    }
  }

  /////////////////////////////ADD DONATION ACCEPTENCE FROM USER////////////////////
  addDonationAcceptecetoFireStore(
      DonationAcceptedmodel donationAcceptedmodel, context, orphanId) async {
    try {
      final donationCollection = db
          .collection("Orphanage")
          .doc(orphanId)
          .collection("Accepted Donations");
      // final donationCollection = db.collection("Accepted Donations");
      final docs = donationCollection.doc();
      docs.set(donationAcceptedmodel.toJson(docs.id));
      notifyListeners();
      print("-------------------doantion accepted user  ---------------");
    } catch (e) {
      return customeShowDiolog("$e", context);
    }
  }

  fetchAllDoanationAccepetence(context,currentuserId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> donationSnapshot =
          await db.collection("Orphanage").doc(currentuserId).collection("Accepted Donations").get();

      donationAcceptenceList = donationSnapshot.docs.map((doc) {
        return DonationAcceptedmodel.fromJson(doc.data());
      }).toList();
      print("-------------------donation  list fetched ---------------");

      notifyListeners();
    } catch (e) {
      return customeShowDiolog("$e", context);
    }
  }
}
