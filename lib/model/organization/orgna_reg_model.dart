class OrgnRegModel {
  String ?loginId;
  String orhnName;
  int contactNumber;
  String email;
  String location;
  String about;

  dynamic orphnId;

  String ?image;

  OrgnRegModel(
      {this.orphnId,
      this.loginId,
      required this.orhnName,
      required this.contactNumber,
      required this.email,
       this.image,
      required this.location,
      required this.about});

  Map<String, dynamic> toJson(id) => {
    "image":image,
    "loginId":loginId,
        "orphnId": id,
        "orphnName": orhnName,
        "contactNumber": contactNumber,
        "email": email,
        "location": location,
        "about": about
      };
  factory OrgnRegModel.fromJson(Map<String, dynamic> json) => OrgnRegModel(
    image: json["image"],
    loginId: json["loginId"],
        orphnId: json["orphnId"],
        orhnName: json["orphnName"],
        contactNumber: json["contactNumber"],
        email: json["email"],
        location: json["location"],
        about: json["about"],
      );
}
