import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todos/ui/utilities/app_colors.dart';

class AppThemeData {
  ///lightTheme
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backGroundLightColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
        selectedIconTheme: IconThemeData(size: 33),
        unselectedIconTheme: IconThemeData(size: 33),
        showUnselectedLabels: false,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        iconSize: 35,
        backgroundColor: AppColors.primaryColor,
        shape:

            ///to do border around FloatingActionButton
            StadiumBorder(side: BorderSide(color: AppColors.white, width: 4)),
        // RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(35),
        //     side: const BorderSide(color: AppColors.white,width: 4)),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        // side: BorderSide()
      )),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ));
}
