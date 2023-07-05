import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(Color color, double size, FontWeight fontWeight){
  return GoogleFonts.poppins(color: color, fontSize: size.sp, fontWeight: fontWeight);
}

const String RandomAPI = "https://dummyjson.com/quotes/random";