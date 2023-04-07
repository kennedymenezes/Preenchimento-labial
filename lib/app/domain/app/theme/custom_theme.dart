
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme  {
  CustomTheme._();
static int primaryColor=0xffF48E8A;
  static ThemeData themeData(){

    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Color(primaryColor),
      ),
      textTheme: TextTheme(
        labelSmall: GoogleFonts.alumniSans(
          textStyle: const TextStyle(
            fontSize: 15,
            color: Color(0xff837B7D),
          ),
        ),
        labelMedium: GoogleFonts.alumniSans(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xff837B7D),
          ),
        ),
        headlineMedium: GoogleFonts.alumniSans(
          textStyle: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        bodyMedium: GoogleFonts.alumniSans(
          textStyle: const TextStyle(fontSize: 16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
                (states) =>  Color(primaryColor),
          ),
          minimumSize: MaterialStateProperty.all(const Size(315, 60)),
        ),
      ),
      primarySwatch: mainAppColor,
      secondaryHeaderColor: MaterialStateColor.resolveWith(
            (states) => const Color(0xffEDE9E9),
      ),
    );

  }

  static MaterialColor mainAppColor = MaterialColor(
    primaryColor,
    <int, Color>{
      50: Color(primaryColor),
      100: Color(primaryColor),
      200: Color(primaryColor),
      300: Color(primaryColor),
      400: Color(primaryColor),
      500: Color(primaryColor),
      600: Color(primaryColor),
      700: Color(primaryColor),
      800: Color(primaryColor),
      900: Color(primaryColor),
    },
  );

}