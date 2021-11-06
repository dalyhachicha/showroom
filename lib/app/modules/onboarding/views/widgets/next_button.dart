import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final void Function() onTap;
  final Color color;
  final Color iconColor;
  NextButton({
    Key? key,
    required this.onTap,
    required this.color,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 40,
        width: 80,
        child: Icon(
          Icons.arrow_forward,
          color: iconColor,
        ),
      ),
    );
  }
}
