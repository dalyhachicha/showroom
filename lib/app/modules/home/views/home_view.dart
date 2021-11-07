import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:showroom/app/data/models/user_model.dart';
import 'package:showroom/app/data/theme/color_theme.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.darkGrey,
        child: DrawerHeader(child: Text('ghh')),
      ),
      backgroundColor: AppColors.darkGrey,
      appBar: appBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  UserModel().logout();
                  Get.offAllNamed(Routes.SPLASH);
                },
                child: Text('Logout')),
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

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
}
