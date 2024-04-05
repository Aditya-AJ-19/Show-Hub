import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static TextStyle customeTextRoboto(
    {Color color = Colors.black,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
    }
  ) {
    return GoogleFonts.roboto(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }
}
