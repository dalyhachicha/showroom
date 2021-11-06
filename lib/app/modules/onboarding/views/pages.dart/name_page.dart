import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:showroom/app/data/theme/color_theme.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/modules/onboarding/views/widgets/next_button.dart';

class NamePage extends StatelessWidget {
  final PageController pageController;
  NamePage(this.pageController);
  // Name Text Controller
  final _nameController = TextEditingController();

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
                      keyboardType: TextInputType.name,
                      onSubmitted: (value) {
                        if (_nameController.text.isEmpty) {
                          Get.snackbar(
                              'Name is empty.', 'Please enter your name!');
                        } else {
                          FocusScope.of(context).unfocus();
                          // save name on submit
                          // OnboardingController().user.name = value.trim();
                          pageController.jumpToPage(2);
                        }
                      },
                      autofocus: true,
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'name_page_hintText'.tr,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _nameController.clear();
                          },
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    NextButton(
                        onTap: () {
                          if (_nameController.text.isEmpty) {
                            Get.snackbar(
                                'Name is empty.', 'Please enter your name!');
                          } else {
                            FocusScope.of(context).unfocus();
                            // save name on button click
                            // OnboardingController().user.name =
                            //     _nameController.text.trim();
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
