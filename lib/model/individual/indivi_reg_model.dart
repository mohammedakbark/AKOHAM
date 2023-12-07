class IndivRegModel {
  // int? senderId;
  //
  String? name;
  int? contactNumber;
  String? email;
  String? location;

  // int? loginId;

  // Image? image;

  IndivRegModel({
    // required this.senderId,
    required this.name,
    required this.contactNumber,
    required this.email,
    // required this.image,
    required this.location,
  });

  Map<String, dynamic> toJson() => {
        "orphnName": name,
        "contactNumber": contactNumber,
        "email": email,
        "location": location,
      };
}
// factory Modell.fromJson(Map<String, dynamic> json) =>
//       Modell(first: json["first"], second: json["second"]);

//   Map<String, dynamic> toJson() => {"first": first, "second": second};