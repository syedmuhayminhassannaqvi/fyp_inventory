import 'dart:convert';

ItemUnitAdd itemUnitAddFromJson(String str) =>
    ItemUnitAdd.fromJson(json.decode(str));

String itemUnitAddToJson(ItemUnitAdd data) => json.encode(data.toJson());

List<ItemUnit> itemUnitFromJsonList(String str) =>
    List<ItemUnit>.from(json.decode(str).map((x) => ItemUnit.fromJson(x)));

String itemUnitListToJson(List<ItemUnit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemUnit {
  int id;
  String iuTitle;
  String? iuDescription;

  ItemUnit({
    required this.id,
    required this.iuTitle,
    this.iuDescription,
  });

  factory ItemUnit.fromJson(Map<String, dynamic> json) => ItemUnit(
        id: json['id'],
        iuTitle: json["iu_title"],
        iuDescription: json["iu_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iu_title": iuTitle,
        "iu_description": iuDescription,
      };
}

class ItemUnitAdd {
  String iuTitle;
  String? iuDescription;

  ItemUnitAdd({
    required this.iuTitle,
    this.iuDescription,
  });

  factory ItemUnitAdd.fromJson(Map<String, dynamic> json) => ItemUnitAdd(
        iuTitle: json["iu_title"],
        iuDescription: json["iu_description"],
      );

  Map<String, dynamic> toJson() => {
        "iu_title": iuTitle,
        "iu_description": iuDescription,
      };
}
