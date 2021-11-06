import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:showroom/app/modules/splash/controllers/auth_manager_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  AuthenticationManager _authManager = Get.find();
                  _authManager.removePhoneNumber();
                },
                child: Text('Delete Phone Number')),
            Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
