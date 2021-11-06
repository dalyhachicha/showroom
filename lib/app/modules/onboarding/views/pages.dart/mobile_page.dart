import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:showroom/app/data/theme/color_theme.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/modules/onboarding/views/widgets/next_button.dart';

class MobilePage extends StatelessWidget {
  final PageController pageController;
  MobilePage(this.pageController);
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkGrey,
      appBar: AppBar(
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
                      maxLength: 8,
                      keyboardType: TextInputType.phone,
                      onSubmitted: (value) {
                        if (_phoneController.text.length < 8) {
                          Get.snackbar('Invalid Phone.',
                              'Please enter your phone number!');
                        } else {
                          FocusScope.of(context).unfocus();
                          // Save Phone Number
                          // OnboardingController().user.phoneNumber =
                          //     '+216' + value.trim();
                          // PhoneService().savePhoneNumber('+216' + value.trim());
                          // OnboardingController()
                          //     .verifyPhone('+216' + value.trim());
                          pageController.jumpToPage(4);
                        }
                      },
                      autofocus: true,
                      controller: _phoneController,
                      decoration: InputDecoration(
                        prefixText: '+216',
                        prefixStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(),
                        hintText: 'phone_page_hintText'.tr,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _phoneController.clear();
                          },
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    NextButton(
                        onTap: () async {
                          if (_phoneController.text.length < 8) {
                            Get.snackbar('Invalid Phone.',
                                'Please enter your phone number!');
                          } else {
                            FocusScope.of(context).unfocus();
                            // save model
                            // OnboardingController().user.phoneNumber =
                            //     '+216' + _phoneController.text.trim();
                            // save to GetStorage
                            // PhoneService().savePhoneNumber(
                            //     '+216' + _phoneController.text.trim());
                            // Send OTP Code
                            // await OnboardingController().verifyPhone(
                            //     '+216' + _phoneController.text.trim());

                            pageController.jumpToPage(4);
                          }
                        },
                        color: AppColors.darkGrey,
                        iconColor: AppColors.extraLightGrey),
                  ],
                ),
              ),
            ),
          ),
          // Top section
          Positioned(
            top: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'phone_page_question'.tr,
                    style: AppTextStyle.onboardingHead,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'phone_page_why'.tr,
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
