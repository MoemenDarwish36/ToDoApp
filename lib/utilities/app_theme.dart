import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

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
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
        selectedIconTheme: IconThemeData(size: 33),
        unselectedIconTheme: IconThemeData(size: 33),
        showUnselectedLabels: false,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        iconSize: 35,
        backgroundColor: AppColors.primaryColor,

        ///to do border around FloatingActionButton
        shape:
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
              fontWeight: FontWeight.bold, color: AppColors.white),
        titleMedium: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black),
        bodyLarge: GoogleFonts.inter(
            fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.black),
        bodyMedium: GoogleFonts.inter(
            fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.black),
      ));

  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backGroundDarkColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: AppColors.blackDarkColor,
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
            StadiumBorder(
                side: BorderSide(color: AppColors.blackDarkColor, width: 4)),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        // side: BorderSide()
      )),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.greenColor,
        ),
        titleLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
        titleMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
        bodyMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
        titleSmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryColor,
        ),
        bodySmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
        labelSmall: TextStyle(
          fontFamily: "Poppins",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryColor,
        ),
        labelMedium: TextStyle(
          fontFamily: "Poppins",
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
        labelLarge: TextStyle(
          fontFamily: "Poppins",
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
      ));
}
//   textTheme: const TextTheme(
//         displayLarge: TextStyle(
//           fontFamily: "Poppins",
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: AppColors.greenColor,
//         ),
//         titleLarge: TextStyle(
//           fontFamily: "Poppins",
//           fontSize: 22,
//           fontWeight: FontWeight.bold,
//           color: AppColors.white,
//         ),
//         titleMedium: TextStyle(
//           fontFamily: "Poppins",
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: AppColors.black,
//         ),
//         bodyLarge: TextStyle(
//           fontFamily: "Poppins",
//           fontSize: 20,
//           fontWeight: FontWeight.w500,
//           color: AppColors.black,
//         ),
//         bodyMedium: TextStyle(
//           fontFamily: "Poppins",
//           fontSize: 18,
//           fontWeight: FontWeight.w400,
//           color: AppColors.black,
//         ),
//         titleSmall: TextStyle(
//           fontFamily: "Poppins",
//           fontSize: 22,
//           fontWeight: FontWeight.w700,
//           color: AppColors.primaryColor,
//         ),
//         bodySmall: TextStyle(
//           fontFamily: "Poppins",
//           fontSize: 18,
//           fontWeight: FontWeight.w400,
//           color: AppColors.black,
//         ),
//         labelSmall: TextStyle(
//           fontFamily: "Poppins",
//           fontSize: 18,
//           fontWeight: FontWeight.w700,
//           color: AppColors.primaryColor,
//         ),
//         labelMedium: TextStyle(
//           fontFamily: "Poppins",
//           fontSize: 25,
//           fontWeight: FontWeight.bold,
//           color: AppColors.black,
//         ),
//         labelLarge: TextStyle(
//           fontFamily: "Poppins",
//           fontSize: 22,
//           fontWeight: FontWeight.w700,
//           color: AppColors.black,
//         ),
//       )
