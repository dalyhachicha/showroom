import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/theme/color_theme.dart';
import 'package:showroom/app/modules/onboarding/views/pages.dart/pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  final PageController pageController = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      alignment: Alignment.center,
      children: [
        PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            WelcomePage(pageController),
            NamePage(pageController),
            LocalisationPage(pageController),
            MobilePage(pageController),
            OtpPage(pageController),
            DonePage(),
          ],
        ),
        Positioned(
          top: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    dotColor: AppColors.grey,
                    activeDotColor: AppColors.extraLightGrey,
                  ),
                  controller: pageController,
                  count: 6,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
