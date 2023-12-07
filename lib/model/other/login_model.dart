class LoginTable {
  String? email;
  String? password;
  int? loginId;
  String? type;
  LoginTable(
      {required this.email,
      required this.password,
      required this.loginId,
      required this.type});
  Map<String, dynamic> toJson() =>
      {"email": email, "password": password, "loginId": loginId, "type": type};
}
