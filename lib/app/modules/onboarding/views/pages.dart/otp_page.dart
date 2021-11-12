import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:showroom/app/data/theme/color_theme.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:showroom/app/modules/onboarding/views/widgets/next_button.dart';
import 'package:showroom/app/modules/widgets/custom_snackbar.dart';

class OtpPage extends StatelessWidget {
  final PageController pageController;
  OtpPage(this.pageController);
  final _otpController = TextEditingController();
  final OnboardingController onBoardingController = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Obx(() {
      if (onBoardingController.authState.value == 'sent') {
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {
                              Future.delayed(Duration(milliseconds: 300),
                                  () async {
                                customSnackbar(
                                  title: 'Wrong phone number?',
                                  message: 'Please re-enter your phone number.',
                                  position: SnackPosition.TOP,
                                );
                                pageController.jumpToPage(3);
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'didnt_rec_msg'.tr,
                                  style: TextStyle(color: AppColors.darkGrey),
                                ),
                                Text(
                                  'resend_code'.tr,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: AppColors.darkGrey),
                                ),
                              ],
                            )),
                        SizedBox(height: 8),
                        TextField(
                          cursorColor: AppColors.darkGrey,
                          maxLength: 6,
                          keyboardType: TextInputType.phone,
                          onSubmitted: (value) async {
                            if (_otpController.text.length < 6) {
                              customSnackbar(
                                title: 'Invalid OTP Code',
                                message: 'OTP is a 6 number code.',
                                position: SnackPosition.TOP,
                              );
                            } else {
                              FocusScope.of(context).unfocus();
                              if (onBoardingController.authState.value ==
                                  'complete') {
                                Future.delayed(Duration(milliseconds: 300),
                                    () async {
                                  pageController.jumpToPage(5);
                                });
                              }
                            }
                          },
                          autofocus: true,
                          controller: _otpController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            prefixStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(),
                            hintText: 'OTP code',
                            suffixIcon: IconButton(
                              onPressed: () {
                                _otpController.clear();
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
                              if (_otpController.text.length < 6) {
                                customSnackbar(
                                  title: 'Invalid OTP Code',
                                  message: 'OTP is a 6 number code.',
                                  position: SnackPosition.TOP,
                                );
                              } else {
                                FocusScope.of(context).unfocus();
                                if (onBoardingController.authState.value ==
                                    'complete') {
                                  pageController.jumpToPage(5);
                                } else if (onBoardingController
                                        .authState.value ==
                                    'sent') {
                                  onBoardingController
                                      .verifyCode(_otpController.text);
                                }
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'otp_page_question'.tr,
                        style: AppTextStyle.onboardingHead,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'otp_page_why'.tr +
                            ' ${onBoardingController.userModel.phoneNumber}',
                        style: AppTextStyle.onBoardingSubHead,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      } else if (onBoardingController.authState.value == 'complete') {
        Future.delayed(Duration(milliseconds: 300), () async {
          pageController.jumpToPage(5);
        });
      } else if (onBoardingController.authState.value == 'failed') {
        return _failedScreen();
      } else if (onBoardingController.authState.value == 'wrong_code') {
        Future.delayed(Duration(milliseconds: 300), () async {
          customSnackbar(
            title: 'Invalid Code',
            message: 'Invalid verification code.',
            position: SnackPosition.TOP,
          );
          pageController.jumpToPage(3);
        });
      } else if (onBoardingController.authState.value == 'timeout') {
        Future.delayed(Duration(milliseconds: 300), () async {
          customSnackbar(
            title: 'Timeout',
            message: 'Timed out waiting for code\nplease try later.',
            position: SnackPosition.TOP,
          );
          pageController.jumpToPage(3);
        });
      }
      return _loadingScreen();
    });
  }

  Widget _loadingScreen() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkGrey,
      appBar: AppBar(
        backgroundColor: AppColors.darkGrey,
        elevation: 0,
      ),
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.extraLightGrey,
        ),
      ),
    );
  }

  // ! fix failed screen UI
  Widget _failedScreen() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.darkGrey,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Something went wrong!',
              style: AppTextStyle.onboardingHead
                  .copyWith(color: AppColors.extraLightGrey),
            ),
            TextButton(
              child: Text(
                'Please try later with a valid phone number and OTP code.',
                style: AppTextStyle.onBoardingButton,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
