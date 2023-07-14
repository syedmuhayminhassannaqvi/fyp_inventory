import 'dart:convert';

UserRole userRoleFromJson(String str) => UserRole.fromJson(json.decode(str));

String userRoleToJson(UserRole data) => json.encode(data.toJson());

class UserRole {
  String urTitle;
  int urRw;
  int uRw;
  int stiRw;
  int siRw;
  int gpRw;
  int poiRw;
  int poRw;
  int suRw;
  int sbRw;
  int dRw;
  int soRw;
  int iRw;
  int iuRw;
  int itRw;
  int icRw;

  UserRole({
    required this.urTitle,
    required this.urRw,
    required this.uRw,
    required this.stiRw,
    required this.siRw,
    required this.gpRw,
    required this.poiRw,
    required this.poRw,
    required this.suRw,
    required this.sbRw,
    required this.dRw,
    required this.soRw,
    required this.iRw,
    required this.iuRw,
    required this.itRw,
    required this.icRw,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
        urTitle: json["ur_title"],
        urRw: json["ur_rw"],
        uRw: json["u_rw"],
        stiRw: json["sti_rw"],
        siRw: json["si_rw"],
        gpRw: json["gp_rw"],
        poiRw: json["poi_rw"],
        poRw: json["po_rw"],
        suRw: json["su_rw"],
        sbRw: json["sb_rw"],
        dRw: json["d_rw"],
        soRw: json["so_rw"],
        iRw: json["i_rw"],
        iuRw: json["iu_rw"],
        itRw: json["it_rw"],
        icRw: json["ic_rw"],
      );

  Map<String, dynamic> toJson() => {
        "ur_title": urTitle,
        "ur_rw": urRw,
        "u_rw": uRw,
        "sti_rw": stiRw,
        "si_rw": siRw,
        "gp_rw": gpRw,
        "poi_rw": poiRw,
        "po_rw": poRw,
        "su_rw": suRw,
        "sb_rw": sbRw,
        "d_rw": dRw,
        "so_rw": soRw,
        "i_rw": iRw,
        "iu_rw": iuRw,
        "it_rw": itRw,
        "ic_rw": icRw,
      };
}
