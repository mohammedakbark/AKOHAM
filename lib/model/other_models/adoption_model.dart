class AdoptionModel {
  String ?adoptionId;
  String senderId;
  String childId;
  String reqStatus;
  AdoptionModel(
      { this.adoptionId,
      required this.childId,
      required this.reqStatus,
      required this.senderId});
      Map<String, dynamic> toJson(id) => {
        "adoptionId": id,
        "senderId": senderId,
        "childId": childId,
      
        "reqStatus": reqStatus,
      };

  factory AdoptionModel.fromJson(Map<String, dynamic> json) =>
      AdoptionModel(
        
          adoptionId: json["adoptionId"],
          senderId:json["senderId"] ,
          childId:json["childId"] ,
          reqStatus:json["reqStatus"] );
}
