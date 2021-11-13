// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.imgUrls,
    required this.sizes,
  });
  String id;
  String name;
  String desc;
  int price;
  List<String> imgUrls;
  List<Size> sizes;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        price: json["price"],
        imgUrls: List<String>.from(json["img_urls"].map((x) => x)),
        sizes: List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "img_urls": List<dynamic>.from(imgUrls.map((x) => x)),
        "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
      };
}

class Size {
  Size({
    required this.size,
    required this.qte,
  });

  String size;
  int qte;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        size: json["size"],
        qte: json["qte"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "qte": qte,
      };
}
