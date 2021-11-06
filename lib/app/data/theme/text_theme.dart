import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showroom/app/data/theme/color_theme.dart';

class AppTextStyle {
  static TextStyle onBoardingButton = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    color: AppColors.extraLightGrey,
    fontSize: 16,
  );
  static TextStyle onBoardingHelp = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.darkGrey,
  );
  static TextStyle onboardingHead = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: AppColors.extraLightGrey,
  );

  static TextStyle onBoardingSubHead = GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontSize: 18,
    color: AppColors.extraLightGrey,
  );
}
