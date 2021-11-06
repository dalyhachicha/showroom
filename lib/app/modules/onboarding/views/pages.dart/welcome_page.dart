import 'package:flutter/material.dart';
import 'package:showroom/app/data/services/language_service.dart';
import 'package:showroom/app/data/theme/color_theme.dart';
import 'package:showroom/app/data/theme/text_theme.dart';

class WelcomePage extends StatelessWidget {
  final PageController pageController;
  WelcomePage(this.pageController);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: AppTextStyle.onboardingHead
                              .copyWith(fontSize: 36),
                        ),
                        Text(
                          'Let\' get started.',
                          style: AppTextStyle.onBoardingSubHead,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height / 2.5,
                  width: width,
                  decoration: BoxDecoration(
                    color: AppColors.extraLightGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 36),
                      Text(
                        'Select language',
                        style: AppTextStyle.onboardingHead
                            .copyWith(color: AppColors.darkGrey),
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          LanguageService().changeLanguage('en', 'US');
                          pageController.jumpToPage(1);
                        },
                        child: Container(
                          width: width * 0.8,
                          height: 60,
                          decoration: BoxDecoration(
                              color: AppColors.darkGrey,
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8, left: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ENGLSIH',
                                  style: AppTextStyle.onBoardingSubHead,
                                ),
                                Image.asset("assets/images/flags/usa_flag.png"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          LanguageService().changeLanguage('fr', 'FR');
                          pageController.jumpToPage(1);
                        },
                        child: Container(
                          width: width * 0.8,
                          height: 60,
                          decoration: BoxDecoration(
                              color: AppColors.darkGrey,
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8, left: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'FRENCH',
                                  style: AppTextStyle.onBoardingSubHead,
                                ),
                                Image.asset("assets/images/flags/fr_flag.png"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
