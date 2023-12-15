// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orphanagemanagement/model/orphanage/orphn_reg_model.dart';
import 'package:orphanagemanagement/model/other_models/adoption_model.dart';
import 'package:orphanagemanagement/model/other_models/help_request_model.dart';
import 'package:orphanagemanagement/utils/variables.dart';
import 'package:orphanagemanagement/viewmodel/firebase_auth.dart';
import 'package:orphanagemanagement/viewmodel/firestore.dart';

class ServiceProvider with ChangeNotifier {
  List<HelpRequestModel> helpReqList = [];
  HelpRequestModel? helpRequestModel;
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





  /////////////////////////////Support orphange to favorate////////////////////

}
  //////////////////////////////////////
  /////////////////////////////
  //////////////////////////////////fetch Supprting orohanage Nmae Na image////////////
  // fectSupportingData(selectedUserId, index, ) async {
//    QuerySnapshot<Map<String, dynamic>> snapshotOrphan =
//         await db.collection("Orphanage").get();
//  final data= storeInstence.  orphanageList = snapshotOrphan.docs.map((doc) {
//       return OrphnRegModel.fromJson(doc.data());
//     }).toList();
//     print("-------fetch orphn-------------");
//     print(data[index].orphnName);
//     if (data[index].orphnId == selectedUserId) {
//       supportList.add(SupportOrphanModel(
//           image: data[index].image!, name: data[index].orphnName));
//     }
//     print("completed");
//   }
// }

// List<SupportOrphanModel> supportList = [];

// class SupportOrphanModel {
//   String image;
//   String name;
//   SupportOrphanModel({required this.image, required this.name});
// }
