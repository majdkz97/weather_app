import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const regular = FontWeight.w400;
const medium = FontWeight.w500;
const semiBold = FontWeight.w600;
const bold = FontWeight.w700;

TextTheme textTheme = TextTheme(
  headline4: GoogleFonts.comfortaa(fontWeight: bold, fontSize: 20.0),
  caption: GoogleFonts.comfortaa(fontWeight: semiBold, fontSize: 16.0),
  headline5: GoogleFonts.comfortaa(fontWeight: medium, fontSize: 16.0),
  subtitle1: GoogleFonts.comfortaa(fontWeight: medium, fontSize: 16.0),
  overline: GoogleFonts.comfortaa(fontWeight: medium, fontSize: 12.0),
  bodyText1: GoogleFonts.comfortaa(fontWeight: regular, fontSize: 14.0),
  subtitle2: GoogleFonts.comfortaa(fontWeight: medium, fontSize: 14.0),
  bodyText2: GoogleFonts.comfortaa(fontWeight: regular, fontSize: 16.0),
  headline6: GoogleFonts.comfortaa(fontWeight: bold, fontSize: 16.0),
  button: GoogleFonts.comfortaa(fontWeight: semiBold, fontSize: 14.0),
);
