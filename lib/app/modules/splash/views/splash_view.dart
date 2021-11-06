import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:showroom/app/modules/home/views/home_view.dart';
import 'package:showroom/app/modules/onboarding/views/onboarding_view.dart';
import 'package:showroom/app/modules/splash/controllers/auth_manager_controller.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());
  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return OnBoard();
          }
        }
      },
      future: initializeSettings(),
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
          Text('Loading...'),
        ],
      ),
    ));
  }
}

class OnBoard extends StatelessWidget {
  OnBoard({Key? key}) : super(key: key);
  final AuthenticationManager _authManager = Get.find();
  @override
  Widget build(BuildContext context) {
    // return Obx(() {

    // });
    return _authManager.isLogged.value ? HomeView() : OnboardingView();
  }
}
