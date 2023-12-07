import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orphanagemanagement/model/individual/indivi_reg_model.dart';
import 'package:orphanagemanagement/model/organization/orgna_reg_model.dart';
import 'package:orphanagemanagement/model/orphanage/bank_detail_model.dart';
import 'package:orphanagemanagement/model/orphanage/orphn_reg_model.dart';
import 'package:orphanagemanagement/model/other/child_detail_model.dart';
import 'package:orphanagemanagement/model/other/child_helath_report.dart';

class FireStore {
  final db = FirebaseFirestore.instance;
////////////////////////////ORPHANAGE//////////////////////////
  Future addOrphnToFirestore(
      OrphnRegModel orphnRegModel, BankDetailModel bankDetailModel) async {
    CollectionReference orphanage = db.collection("Orphanage");
    DocumentReference docs = orphanage.doc(orphnRegModel.email);
    // await doc.set(model.toJson());
    CollectionReference orphangeDetails = docs.collection("orphanageDetails");
    await orphangeDetails.doc().set(orphnRegModel.toJson());
    CollectionReference bankDetails = docs.collection("bankDetails");
    await bankDetails.doc().set(bankDetailModel.toJson());
    // getDataFromFirestore();
  }
///////////////////////////iNDIVIDUAL//////////////////////////////////

  Future addIndividualToFirestore(IndivRegModel indivRegModel) async {
    CollectionReference individual = db.collection("individual");
    DocumentReference docs = individual.doc(indivRegModel.email);
    await docs.set(indivRegModel.toJson());
  }

/////////////////////////ORGANIZATION//////////////////////////////
  Future addOrganizationToFirestore(OrgnRegModel orgnRegModel) async {
    CollectionReference organization = db.collection("organization");
    DocumentReference docs = organization.doc(orgnRegModel.email);
    await docs.set(orgnRegModel.toJson());
  }
  //////////////////////////////ADD CHILD //////////////////////////

  Future addChildToFirestore(ChildDataRegModel childDataRegModel,
      ChildHealthReport childHealthReport) async {
    CollectionReference childData = db.collection("ChildData");
    DocumentReference docs = childData.doc();
    CollectionReference childInfo = docs.collection("ChildInfo");
    await childInfo.doc();
  }
}
