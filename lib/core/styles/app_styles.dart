import 'package:cake_local/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle itemStyle = GoogleFonts.roboto(
    color: AppColors.blackColor,
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
  );

  static TextStyle priceStyle = GoogleFonts.roboto(
    color: AppColors.primaryColor,
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
  );
  static TextStyle titleStyle = GoogleFonts.roboto(
    color: const Color(0xFF282828),
    fontSize: 30,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
  );
}
