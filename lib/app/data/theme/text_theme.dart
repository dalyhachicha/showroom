import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showroom/app/data/theme/color_theme.dart';

class AppTextStyle {
  static TextStyle productCardPrice = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.extraLightGrey,
  );
  static TextStyle productCardTitle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.extraLightGrey,
  );
  static TextStyle drawerItemText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle drawerTitle = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );
  static TextStyle appBarTitle = GoogleFonts.montserrat(
      fontSize: 20, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic);
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
