import 'package:flutter/material.dart';

class ChildDataRegModel {
  dynamic childId;
  String? name;
  String? nickNmae;
  int? age;
  String? gender;
  dynamic dirthdate;
  dynamic joinDate;
  String? location;
  String? bloodGroup;
  String? orphanType;
  String? adoptionStatus;
  // Image? image;
  ChildDataRegModel({
    required this.adoptionStatus,
    required this.age,
    required this.bloodGroup,
    required this.dirthdate,
    required this.gender,
    required this.joinDate,
    required this.location,
    required this.name,
    required this.nickNmae,
    required this.orphanType,
    required this.childId,
  });

  Map<String, dynamic> toJson() => {
        "id": childId,
        "adoptionStatus": adoptionStatus,
        "age": age,
        "bloodGroup": bloodGroup,
        "dirthdate": dirthdate,
        "gender": gender,
        "joinDate": joinDate,
        "location": location,
        "name": name,
        "nickNmae": nickNmae,
        "orphanType": orphanType
      };
}
