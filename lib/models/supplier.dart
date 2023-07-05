import 'dart:convert';

Supplier supplierFromJson(String str) => Supplier.fromJson(json.decode(str));

String supplierToJson(Supplier data) => json.encode(data.toJson());

List<Supplier> supplierFromJsonList(String str) =>
    List<Supplier>.from(json.decode(str).map((x) => Supplier.fromJson(x)));

String supplierListToJson(List<Supplier> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Supplier {
  String suName;
  String suPhone;
  String? suEmail = "";
  String? suAddress = "";

  Supplier({
    required this.suName,
    required this.suPhone,
    this.suEmail,
    this.suAddress,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        suName: json["su_name"],
        suPhone: json["su_phone"],
        suEmail: json["su_email"],
        suAddress: json["su_address"],
      );

  Map<String, dynamic> toJson() => {
        "su_name": suName,
        "su_phone": suPhone,
        "su_email": suEmail,
        "su_address": suAddress,
      };
}
