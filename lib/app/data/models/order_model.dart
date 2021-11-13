// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  @override
  @override
  OrderModel({
    this.id,
    this.date,
    this.order_by,
    this.total,
    this.selectedSizes,
    this.items,
    this.status,
  });
  String? id;
  String? date;
  String? order_by;
  String? total;
  List<String>? selectedSizes;
  List<String>? items;
  String? status;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        date: json["date"],
        order_by: json["order_by"],
        total: json["total"],
        selectedSizes: List<String>.from(json["selected_sizes"].map((x) => x)),
        items: List<String>.from(json["items"].map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "order_by": order_by,
        "total": total,
        "selected_sizes": List<dynamic>.from(selectedSizes!.map((x) => x)),
        "items": List<dynamic>.from(items!.map((x) => x)),
        "status": status,
      };

  toList() {}
}
