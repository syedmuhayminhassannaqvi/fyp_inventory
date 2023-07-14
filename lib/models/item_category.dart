import 'dart:convert';

ItemCategoryAdd itemCategoryAddFromJson(String str) =>
    ItemCategoryAdd.fromJson(json.decode(str));

String itemCategoryAddToJson(ItemCategoryAdd data) =>
    json.encode(data.toJson());

List<ItemCategory> itemCategoryFromJsonList(String str) =>
    List<ItemCategory>.from(
        json.decode(str).map((x) => ItemCategory.fromJson(x)));

String itemCategoryListToJson(List<ItemCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemCategory {
  int id;
  String icTitle;
  String? icDescription;

  ItemCategory({
    required this.id,
    required this.icTitle,
    this.icDescription,
  });

  factory ItemCategory.fromJson(Map<String, dynamic> json) => ItemCategory(
        id: json['id'],
        icTitle: json["ic_title"],
        icDescription: json["ic_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ic_title": icTitle,
        "ic_description": icDescription,
      };
}

class ItemCategoryAdd {
  String icTitle;
  String? icDescription;

  ItemCategoryAdd({
    required this.icTitle,
    this.icDescription,
  });

  factory ItemCategoryAdd.fromJson(Map<String, dynamic> json) =>
      ItemCategoryAdd(
        icTitle: json["ic_title"],
        icDescription: json["ic_description"],
      );

  Map<String, dynamic> toJson() => {
        "ic_title": icTitle,
        "ic_description": icDescription,
      };
}
