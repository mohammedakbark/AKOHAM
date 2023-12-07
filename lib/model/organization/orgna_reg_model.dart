class OrgnRegModel {
  
  String? orgName;
  int? contactNumber;
  String? email;
  String? location;
  String? about;

  // int? loginId;

  // Image? image;

  OrgnRegModel({
 
    required this.orgName,
    required this.contactNumber,
    required this.email,
    // required this.image,
    required this.location,
    required this.about

  });

  Map<String, dynamic> toJson() => {
        "orphnName": orgName,
        "contactNumber": contactNumber,
        "email": email,
        "location": location,
        "about":about
      };
}
// factory Modell.fromJson(Map<String, dynamic> json) =>
//       Modell(first: json["first"], second: json["second"]);

//   Map<String, dynamic> toJson() => {"first": first, "second": second};