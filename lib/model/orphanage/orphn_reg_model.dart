

class OrphnRegModel {
  // int? orphnId;
  //
  String? orphnName;
  String? about;
  int? childCount;
  int? contactNumber;
  String? email;
  String? location;
  //
  // int? loginId;
  //
  // Image? image;
  // int? workersCount;
  OrphnRegModel(
      {
        // required this.orphnId,
      required this.orphnName,
      required this.about,
      required this.childCount,
      required this.contactNumber,
      required this.email,
      // required this.image,
      required this.location,
      // required this.loginId,
      // required this.workersCount
      });

  Map<String, dynamic> toJson() => {
        // "orphnId": orphnId,
        "orphnName": orphnName,
        "about": about,
        "childCount": childCount,
        "contactNumber": contactNumber,
        "email": email,
        "location": location,
        // "loginId": loginId,
        // "image": image,
        // "workersCount": workersCount
      };
}
// factory Modell.fromJson(Map<String, dynamic> json) =>
//       Modell(first: json["first"], second: json["second"]);

//   Map<String, dynamic> toJson() => {"first": first, "second": second};