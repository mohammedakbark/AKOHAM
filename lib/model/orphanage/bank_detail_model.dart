class BankDetailModel {
  // int? orphnId;
  String? bank;
  String? epaymentnumber;
  int? contactNumber;
  BankDetailModel(
      {
        // required this.orphnId,
      required this.bank,
      required this.contactNumber,
      required this.epaymentnumber});
  Map<String, dynamic> toJson() => {
        // "orphnId": orphnId,
        "bank": bank,
        "epaymentNumber": epaymentnumber,
        "contactNumber": contactNumber,
      };
}
