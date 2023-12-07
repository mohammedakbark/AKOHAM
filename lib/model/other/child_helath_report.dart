class ChildHealthReport {
  String? medicalStatus;
  String? diseases;
  String? disabilities;
  String? heght;
  String? weight;
  String? medicines;
  int? childid;
  ChildHealthReport(
      {required this.childid,
      required this.disabilities,
      required this.diseases,
      required this.heght,
      required this.medicalStatus,
      required this.medicines,
      required this.weight});

  Map<String, dynamic> toJson() => {
        "childid": childid,
        "disabilities": disabilities,
        "diseases": diseases,
        "heght": heght,
        "medicalStatus": medicalStatus,
        "medicines": medicines,
        "weight": weight
      };
}
