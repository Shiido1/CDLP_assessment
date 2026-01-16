// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:assessment/appAsset/app_validation.dart';
import 'package:assessment/core/connect_end/model/login_entity_model.dart';
import 'package:assessment/widgets/text.dart';
import 'package:assessment/widgets/text_form_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'core/connect_end/viewmodel/viewmodel.dart';
import 'core/core_folder/app/app.locator.dart';
import 'widgets/button_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneNoController = TextEditingController();
  TextEditingController pinController =
      TextEditingController(); // Initial state is false (off)

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModel>.reactive(
      viewModelBuilder: () => locator<ViewModel>(),
      onViewModelReady: (model) {
        model.getSaveSharedPreferenceDarkMode();
      },
      disposeViewModel: false,
      builder: (_, ViewModel model, _) {
        return Scaffold(
          backgroundColor: !model.isOnDark ? Colors.white : Colors.black,
          body: Stack(
            children: [
              Positioned(
                top: -10,
                left: 151,
                child: Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(300),
                    decoration: BoxDecoration(
                      color: !model.isOnDark
                          ? Colors.white
                          : Colors.white.withOpacity(.52),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -134.0,
                left: -131,
                child: Container(
                  padding: EdgeInsets.all(34.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(100),
                    decoration: BoxDecoration(
                      color: !model.isOnDark
                          ? Colors.white
                          : Colors.white.withOpacity(.52),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Center(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
                        Card(
                          elevation: 3,
                          margin: EdgeInsets.symmetric(horizontal: 28.2),
                          color: !model.isOnDark
                              ? Colors.white.withOpacity(.444)
                              : Colors.white.withOpacity(.012),
                          shadowColor: !model.isOnDark
                              ? Colors.white
                              : Colors.transparent,
                          surfaceTintColor: Colors.transparent, // Material 3 fix
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: !model.isOnDark
                                      ? Colors.white.withOpacity(0.68)
                                      : Colors
                                            .transparent, // 👈 controls "how white"
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(
                                      0.9,
                                    ), // optional glass border
                                  ),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextView(
                                      text: 'CDLP Login',
                    
                                      textStyle: TextStyle(
                                        fontFamily: 'GoogleSans',
                                        fontSize: 23.30,
                                        fontWeight: FontWeight.w600,
                                        color: !model.isOnDark
                                            ? Colors.blue
                                            : Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 22),
                                    TextFormWidget(
                                      hint: 'Phone Number',
                                      cursorColor: model.isOnDark
                                          ? Colors.white
                                          : Colors.black,
                                      hintColor: !model.isOnDark
                                          ? Colors.black
                                          : Colors.white,
                                      label: 'Enter phone number',
                                      labelStyle: TextStyle(
                                        color: !model.isOnDark
                                            ? Colors.grey
                                            : Colors.white,
                                      ),
                                      borderTopLeft: 12,
                                      borderTopRight: 12,
                                      borderBottomLeft: 12,
                                      borderBottomRight: 12,
                                      isFilled: !model.isOnDark ? false : true,
                                      fillColor: !model.isOnDark
                                          ? Colors.white
                                          : Colors.white.withOpacity(.3),
                                      borderColor: Colors.blue,
                                      controller: phoneNoController,
                                      keyboardType: TextInputType.number,
                                      validator: AppValidator.validatePhone(),
                                      style: TextStyle(
                                        // 👈 THIS controls input text
                                        color: !model.isOnDark
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormWidget(
                                      hint: 'Password',
                                      label: 'Enter password',
                                      hintColor: !model.isOnDark
                                          ? Colors.black
                                          : Colors.white,
                                      labelStyle: TextStyle(
                                        color: !model.isOnDark
                                            ? Colors.grey
                                            : Colors.white,
                                      ),
                                      borderTopLeft: 12,
                                      borderTopRight: 12,
                                      borderBottomLeft: 12,
                                      borderBottomRight: 12,
                                      isFilled: !model.isOnDark ? false : true,
                                      fillColor: !model.isOnDark
                                          ? Colors.white
                                          : Colors.white.withOpacity(.3),
                                      borderColor: Colors.blue,
                                      controller: pinController,
                                      keyboardType: TextInputType.number,
                                      validator: AppValidator.validateString(),
                                      style: TextStyle(
                                        // 👈 THIS controls input text
                                        color: !model.isOnDark
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 16,
                                      ),
                                      cursorColor: model.isOnDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    SizedBox(height: 16),
                    
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: !model.isOnDark
                                              ? Colors.black
                                              : Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        children: [
                                          const TextSpan(
                                            text: "Don’t have an account? ",
                                          ),
                                          TextSpan(
                                            text: "Sign Up",
                                            style: TextStyle(
                                              color: !model.isOnDark
                                                  ? Colors.blue
                                                  : Colors.black,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 50),
                                    ButtonWidget(
                                      border: 10,
                                      buttonColor: Colors.blue,
                                      buttonText: 'Sign In',
                                      color: Colors.white,
                                      buttonBorderColor: Colors.transparent,
                                      isLoading: model.isLoading,
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          model.signIn(
                                            context,
                                            signInEntity: LoginEntityModel(
                                              phone:
                                                  '+234${phoneNoController.text.trim()}',
                                              pin: pinController.text.trim(),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextView(
                                          text: 'Dark Mode',
                                          textStyle: GoogleFonts.aBeeZee(
                                            fontSize: 15.30,
                                            fontWeight: FontWeight.w400,
                                            color: !model.isOnDark
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 12.20),
                                        Switch(
                                          activeColor: Colors.blue,
                                          value: model
                                              .isOnDark, // The current value of the switch
                                          onChanged: model
                                              .toggleSwitch, // Callback function when the user toggles the switch
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
