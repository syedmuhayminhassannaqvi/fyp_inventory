import 'dart:convert';

ItemTypeAdd itemTypeAddFromJson(String str) =>
    ItemTypeAdd.fromJson(json.decode(str));

String itemTypeAddToJson(ItemTypeAdd data) => json.encode(data.toJson());

List<ItemType> itemTypeFromJsonList(String str) =>
    List<ItemType>.from(json.decode(str).map((x) => ItemType.fromJson(x)));

String itemTypeListToJson(List<ItemType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemType {
  int id;
  String itTitle;
  String? itDescription;

  ItemType({
    required this.id,
    required this.itTitle,
    this.itDescription,
  });

  factory ItemType.fromJson(Map<String, dynamic> json) => ItemType(
        id: json['id'],
        itTitle: json["it_title"],
        itDescription: json["it_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "it_title": itTitle,
        "it_description": itDescription,
      };
}

class ItemTypeAdd {
  String itTitle;
  String? itDescription;

  ItemTypeAdd({
    required this.itTitle,
    this.itDescription,
  });

  factory ItemTypeAdd.fromJson(Map<String, dynamic> json) => ItemTypeAdd(
        itTitle: json["it_title"],
        itDescription: json["it_description"],
      );

  Map<String, dynamic> toJson() => {
        "it_title": itTitle,
        "it_description": itDescription,
      };
}
