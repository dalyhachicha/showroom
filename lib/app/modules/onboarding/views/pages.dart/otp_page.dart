import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class OtpPage extends StatelessWidget {
  final PageController pageController;
  OtpPage(this.pageController);
  final _otpController = TextEditingController();
  // OnboardingController onBoardingController = Get.find();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold();
    // ! FIX THIS PAGE
    // return Obx(() {
    //   if (onBoardingController.authState.value == 'loading') {
    //     return Scaffold(
    //       resizeToAvoidBottomInset: false,
    //       backgroundColor: AppColors.darkGrey,
    //       appBar: AppBar(
    //         elevation: 0,
    //       ),
    //       body: Center(
    //         child: CircularProgressIndicator(
    //           color: AppColors.extraLightGrey,
    //         ),
    //       ),
    //     );
    //   } else {
    //     return Scaffold(
    //       resizeToAvoidBottomInset: false,
    //       backgroundColor: AppColors.darkGrey,
    //       appBar: AppBar(
    //         elevation: 0,
    //       ),
    //       body: Stack(
    //         children: [
    //           Positioned(
    //             bottom: 0,
    //             child: Container(
    //               height: height * 0.70,
    //               width: width,
    //               decoration: BoxDecoration(
    //                 color: AppColors.extraLightGrey,
    //                 borderRadius: BorderRadius.only(
    //                   topLeft: Radius.circular(24),
    //                   topRight: Radius.circular(24),
    //                 ),
    //               ),
    //               child: Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                     vertical: 24, horizontal: 48),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: [
    //                     TextField(
    //                       maxLength: 6,
    //                       keyboardType: TextInputType.phone,
    //                       onSubmitted: (value) async {
    //                         if (_otpController.text.length < 6) {
    //                           Get.snackbar(
    //                               'Invalid OTP', 'OTP length must be > 6');
    //                         } else {
    //                           FocusScope.of(context).unfocus();
    //                           bool verified = await onBoardingController
    //                               .verifyOTP(_otpController.text.trim());
    //                           if (verified == true) {
    //                             pageController.jumpToPage(5);
    //                           }
    //                         }
    //                       },
    //                       autofocus: true,
    //                       controller: _otpController,
    //                       decoration: InputDecoration(
    //                         prefixStyle: TextStyle(fontSize: 16),
    //                         border: OutlineInputBorder(),
    //                         hintText: 'OTP code',
    //                         suffixIcon: IconButton(
    //                           onPressed: () {
    //                             _otpController.clear();
    //                           },
    //                           icon: Icon(Icons.clear),
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(height: 24),
    //                     NextButton(
    //                         onTap: () {
    //                           if (_otpController.text.length < 6) {
    //                             Get.snackbar(
    //                                 'Invalid OTP', 'OTP length must be > 6');
    //                           } else {
    //                             FocusScope.of(context).unfocus();
    //                             pageController.jumpToPage(5);
    //                           }
    //                         },
    //                         color: AppColors.darkGrey,
    //                         iconColor: AppColors.extraLightGrey),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //           // Top section
    //           Positioned(
    //             top: 0,
    //             child: Padding(
    //               padding:
    //                   const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     'otp_page_question'.tr,
    //                     style: AppTxtStyle.onboardingHead,
    //                   ),
    //                   SizedBox(height: 8),
    //                   Text(
    //                     'otp_page_why'.tr,
    //                     style: AppTxtStyle.onBoardingSubHead,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   }
    // });
  }
}
