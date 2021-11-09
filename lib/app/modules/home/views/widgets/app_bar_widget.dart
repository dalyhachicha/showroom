import 'package:flutter/material.dart';
import 'package:showroom/app/data/theme/text_theme.dart';

appBar() {
  return AppBar(
    // leading: Icon(Icons.menu),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.shopping_bag),
      ),
    ],
    title: Text(
      'Showroom',
      style: AppTextStyle.appBarTitle,
    ),
    centerTitle: true,
  );
}
