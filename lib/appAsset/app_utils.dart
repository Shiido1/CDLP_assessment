import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/text.dart';

class AppUtils {
  static Future<void> snackbar(
    BuildContext? context, {
    required String? message,
    bool error = false,
  }) {
    return Flushbar(
      messageText: TextView(
        text: message?? '',
        textStyle: GoogleFonts.lato(
          fontSize: 14.70,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 3),
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.white,
      margin: EdgeInsets.all(16),
      icon: error
          ? Padding(
              padding: EdgeInsets.only(left: 10.6),
              child: Icon(Icons.cancel, color: Colors.red, size: 22.0),
            )
          : Padding(
              padding: EdgeInsets.only(left: 10.6),
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 22.0,
              ),
            ),
      borderRadius: BorderRadius.circular(8),
    ).show(context!);
  }

  static Future<void> snackbarNoCap(
    BuildContext? context, {
    required String? message,
    bool error = false,
  }) {
    return Flushbar(
      messageText: TextView(
        text: message ?? '',
        textStyle: GoogleFonts.lato(
          fontSize: 14.70,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 3),
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.white,
      // margin: EdgeInsets.all(16.w),
      icon: error
          ? Padding(
              padding: EdgeInsets.only(left: 10.6),
              child: Icon(Icons.cancel, color: Colors.red, size: 22.0),
            )
          : Padding(
              padding: EdgeInsets.only(left: 10.6),
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 22.0,
              ),
            ),
      borderRadius: BorderRadius.circular(8),
    ).show(context!);
  }
}
