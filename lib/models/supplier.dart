import 'dart:convert';

SupplierAdd supplierAddFromJson(String str) =>
    SupplierAdd.fromJson(json.decode(str));

String supplierAddToJson(SupplierAdd data) => json.encode(data.toJson());

List<Supplier> supplierFromJsonList(String str) =>
    List<Supplier>.from(json.decode(str).map((x) => Supplier.fromJson(x)));

String supplierListToJson(List<Supplier> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Supplier {
  int id;
  String suName;
  String suPhone;

  Supplier({
    required this.id,
    required this.suName,
    required this.suPhone,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        id: json['id'],
        suName: json["su_name"],
        suPhone: json["su_phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "su_name": suName,
        "su_phone": suPhone,
      };
}

class SupplierAdd {
  String suName;
  String suPhone;
  String? suEmail = "";
  String? suAddress = "";

  SupplierAdd({
    required this.suName,
    required this.suPhone,
    this.suEmail,
    this.suAddress,
  });

  factory SupplierAdd.fromJson(Map<String, dynamic> json) => SupplierAdd(
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
