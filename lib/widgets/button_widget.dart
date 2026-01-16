// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:assessment/core/core_folder/app/app.router.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'text.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.buttonText,
    this.color,
    this.buttonColor,
    this.buttonHeight = 42.60,
    this.buttonWidth = double.infinity,
    this.isLight = true,
    this.buttonBorderColor,
    this.border = 10.0,
    this.onPressed,
    this.textStyle,
    this.isLoading = false,
    this.fontSize = 18.0,
  });
  final String? buttonText;
  final double? border;
  final double? fontSize;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? color;
  final Color? buttonColor;
  final Color? buttonBorderColor;
  final bool? isLight;
  final bool? isLoading;
  final Function()? onPressed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: buttonWidth!,
        height: buttonHeight!,
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(buttonColor!),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(border!),
              side: BorderSide(color: buttonBorderColor!, width: 1),
            ),
          ),
        ),
        child: isLoading!
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextView(
                    text: 'Loading..!',
                    textStyle: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400,
                      fontSize: 13.72,
                      color: color,
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.2,
                      backgroundColor: Colors.white.withOpacity(.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            : TextView(
                text: buttonText!,
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize!,
                  color: color,
                ),
              ),
      ),
    );
  }
}

class GlobalNavigator extends StatelessWidget {
  GlobalNavigator({super.key, this.color = Colors.black});
  Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigate.back();
        navigate.navigateTo(Routes.dashoardScreen);
      },
      child: Container(
        padding: EdgeInsets.all(4.10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.10),
          border: Border.all(color: color!),
        ),
        child: Icon(Icons.arrow_back_ios_new, size: 14, color: color),
      ),
    );
  }
}
