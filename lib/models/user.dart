import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String uName;
  String uEmail;
  String uPhone;
  Ur ur;

  User({
    required this.uName,
    required this.uEmail,
    required this.uPhone,
    required this.ur,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        uName: json["u_name"],
        uEmail: json["u_email"],
        uPhone: json["u_phone"],
        ur: Ur.fromJson(json["ur"]),
      );

  Map<String, dynamic> toJson() => {
        "u_name": uName,
        "u_email": uEmail,
        "u_phone": uPhone,
        "ur": ur.toJson(),
      };
}

class Ur {
  int id;
  String urTitle;

  Ur({
    required this.id,
    required this.urTitle,
  });

  factory Ur.fromJson(Map<String, dynamic> json) => Ur(
        id: json["id"],
        urTitle: json["ur_title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ur_title": urTitle,
      };
}
