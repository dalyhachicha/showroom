import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WishlistView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WishlistView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
