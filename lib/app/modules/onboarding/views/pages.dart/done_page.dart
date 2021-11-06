import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:showroom/app/data/theme/color_theme.dart';
import 'package:showroom/app/data/theme/text_theme.dart';

class DonePage extends StatelessWidget {
  const DonePage({Key? key}) : super(key: key);

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
              height: height * 0.5,
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
                    SizedBox(height: 48),
                    Text(
                      'done_page_text'.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.onboardingHead
                          .copyWith(fontSize: 24, color: AppColors.darkGrey),
                    ),
                    SizedBox(height: 48),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 60),
                          decoration: BoxDecoration(
                            color: AppColors.darkGrey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 40,
                          width: 240,
                          child: Text(
                            'done_page_button'.tr,
                            textAlign: TextAlign.center,
                            style: AppTextStyle.onBoardingButton,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
