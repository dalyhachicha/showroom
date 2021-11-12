import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarCounterWidget extends StatelessWidget {
  final int count;
  AppBarCounterWidget({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(12),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.onBackground,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            count.toString(),
            style: TextStyle(
              color: Get.theme.colorScheme.background,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
