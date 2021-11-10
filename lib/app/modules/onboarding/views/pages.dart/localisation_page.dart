import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/theme/color_theme.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:showroom/app/modules/onboarding/views/widgets/next_button.dart';

class LocalisationPage extends StatelessWidget {
  final PageController pageController;
  LocalisationPage(this.pageController);
  final _addressController = TextEditingController();
  final OnboardingController onboardingController = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkGrey,
      appBar: AppBar(
        backgroundColor: AppColors.darkGrey,
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(children: [
        Positioned(
          bottom: 0,
          child: Container(
            height: height * 0.75,
            width: width,
            decoration: BoxDecoration(
              color: AppColors.extraLightGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 72),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'adr_page_button_help'.tr,
                      style: AppTextStyle.onBoardingHelp,
                    ),
                    SizedBox(height: 8),
                    getLocationButton(),
                    SizedBox(height: 24),
                    TextField(
                      cursorColor: AppColors.darkGrey,
                      keyboardType: TextInputType.streetAddress,
                      controller: _addressController,
                      onSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                        helperStyle: TextStyle(color: AppColors.darkGrey),
                        helperText: 'adr_page_helper'.tr,
                        hintText: 'adr_page_hint'.tr,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _addressController.clear();
                          },
                          icon: Icon(
                            Icons.clear,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 72),
                    NextButton(
                        onTap: () {
                          if (_addressController.text.isEmpty) {
                            Get.snackbar(
                              'Address is empty.',
                              'Please enter your address!',
                              colorText: AppColors.lightGrey,
                            );
                          } else {
                            FocusScope.of(context).unfocus();
                            onboardingController.userModel.address =
                                _addressController.text.trim();
                            pageController.jumpToPage(3);
                          }
                        },
                        color: AppColors.darkGrey,
                        iconColor: AppColors.extraLightGrey)
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'adr_page_question'.tr,
                  style: AppTextStyle.onboardingHead,
                ),
                SizedBox(height: 8),
                Text(
                  'adr_page_why'.tr,
                  style: AppTextStyle.onBoardingSubHead,
                ),
                SizedBox(height: 72),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget getLocationButton() {
    return GestureDetector(
      onTap: () async {
        await onboardingController.determinePosition().then((value) {
          _addressController.text =
              '${value.latitude.toString()}, ${value.longitude.toString()}';
        });
      },
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.circular(40),
          ),
          height: 40,
          width: 240,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.location_on,
                color: AppColors.extraLightGrey,
                size: 30,
              ),
              Text(
                'adr_page_button'.tr,
                style: AppTextStyle.onBoardingButton,
              ),
              SizedBox(width: 8),
            ],
          )),
    );
  }
}
