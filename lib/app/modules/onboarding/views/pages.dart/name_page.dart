import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:showroom/app/data/theme/color_theme.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:showroom/app/modules/onboarding/views/widgets/next_button.dart';
import 'package:showroom/app/modules/widgets/custom_snackbar.dart';

class NamePage extends StatelessWidget {
  final PageController pageController;
  NamePage(this.pageController);
  // Name Text Controller
  final _nameController = TextEditingController();
  //onBoardingController
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
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: height * 0.70,
              width: width,
              decoration: BoxDecoration(
                color: AppColors.extraLightGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                      cursorColor: AppColors.darkGrey,
                      keyboardType: TextInputType.name,
                      onSubmitted: (value) {
                        if (_nameController.text.isEmpty) {
                          customSnackbar(
                            title: 'Name is empty',
                            message: 'Please enter your name',
                            position: SnackPosition.TOP,
                          );
                        } else {
                          FocusScope.of(context).unfocus();
                          onboardingController.userModel.name = value.trim();
                          pageController.jumpToPage(2);
                        }
                      },
                      autofocus: true,
                      controller: _nameController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                        hintText: 'name_page_hintText'.tr,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _nameController.clear();
                          },
                          icon: Icon(
                            Icons.clear,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    NextButton(
                        onTap: () {
                          if (_nameController.text.isEmpty) {
                            customSnackbar(
                              title: 'Name is Empty',
                              message: 'Please enter your name.',
                              position: SnackPosition.TOP,
                            );
                          } else {
                            FocusScope.of(context).unfocus();
                            onboardingController.userModel.name =
                                _nameController.text.trim();
                            pageController.jumpToPage(2);
                          }
                        },
                        color: AppColors.darkGrey,
                        iconColor: AppColors.extraLightGrey),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'name_page_question'.tr,
                    style: AppTextStyle.onboardingHead,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'name_page_why'.tr,
                    style: AppTextStyle.onBoardingSubHead,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
