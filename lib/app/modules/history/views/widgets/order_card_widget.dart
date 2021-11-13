import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/models/order_model.dart';
import 'package:showroom/app/data/theme/color_theme.dart';
import 'package:showroom/app/data/theme/text_theme.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#Order_${order.id!.substring(0, 8)}',
                style: AppTextStyle.cartPageProductName,
              ),
              Text(
                'Order date: ${order.date!.substring(0, 16)}',
                style: AppTextStyle.cartPageProductName,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '${order.total!} dt',
                style: AppTextStyle.productPagePriceLabel,
              ),
              statusContainer(status: order.status!),
            ],
          ),
        ],
      ),
    );
  }

  Widget statusContainer({required String status}) {
    return Container(
      decoration: BoxDecoration(
        color: getColor(status),
        borderRadius: BorderRadius.circular(12),
      ),
      width: 120,
      height: 32,
      child: Center(
        child: Text(
          status,
          style: AppTextStyle.historyPageStatus,
        ),
      ),
    );
  }

  Color getColor(String status) {
    switch (status) {
      case "hold":
        return Color(0xFF6577B3);
      case "delivery":
        return Color(0xFFED944D);
      case "delivered?":
        return Color(0xFFB3E6B5);
      case "delivered":
        return Color(0xFF48A14D);
      case "canceled":
        return Color(0xFFB33F40);
      default:
        return Color(0xFFB3E6B5);
    }
  }
}
