// ignore_for_file: deprecated_member_use
import 'dart:ui';
import 'package:assessment/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'appAsset/app_validation.dart';
import 'core/connect_end/model/update_pharmacy_profile_entity_model/update_pharmacy_profile_entity_model.dart';
import 'core/connect_end/viewmodel/viewmodel.dart';
import 'widgets/button_widget.dart';
import 'widgets/text_form_widget.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController lgaController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModel>.reactive(
      viewModelBuilder: () => ViewModel(),
      onViewModelReady: (model) async {
        print('preferences::::${model.session.usersData}');
        model.getSaveSharedPreferenceDarkMode();
        await model.getTenant(context);
        emailController.text =
            model.getTetantResponseModel?.data?.contactEmail ??
            model.session.usersData['contactEmail'] ??
            '';
        nameController.text =
            model.getTetantResponseModel?.data?.contactPersonName ??
            model.session.usersData['contactPersonName'] ??
            '';
        stateController.text =
            model.getTetantResponseModel?.data?.state ??
            model.session.usersData['state'] ??
            '';
        lgaController.text =
            model.getTetantResponseModel?.data?.lga ??
            model.session.usersData['lga'] ??
            '';
        addressController.text =
            model.getTetantResponseModel?.data?.businessAddress ??
            model.session.usersData['businessAddress'] ??
            '';
        countryController.text =
            model.getTetantResponseModel?.data?.country ??
            model.session.usersData['country'] ??
            '';
      },
      disposeViewModel: false,
      builder: (_, ViewModel model, _) {
        return Scaffold(
          backgroundColor: !model.isOnDark ? Colors.white : Colors.black,
          body: Stack(
            children: [
              Positioned(
                top: 31,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 40.0,
                    right: 16,
                    left: 16,
                    bottom: 20,
                  ),
                  child: Row(
                    children: [
                      GlobalNavigator(
                        color: !model.isOnDark ? Colors.black : Colors.white,
                      ),

                      SizedBox(width: 180),
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
                          SizedBox(width: 10),
                          Switch(
                            activeColor: Colors.blue,
                            value: model
                                .isOnDark, // The current value of the switch
                            onChanged: model
                                .toggleSwitch, // Callback function when the user toggles the switch
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -14,
                left: 281,
                child: Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(300),
                    decoration: BoxDecoration(
                      color: !model.isOnDark ? Colors.white : Colors.black,
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
                          : const Color.fromARGB(
                              14,
                              20,
                              26,
                              31,
                            ).withOpacity(.72),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 100),
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
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .75,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextView(
                                        text: 'Profile',
                                        textStyle: GoogleFonts.aBeeZee(
                                          fontSize: 20.30,
                                          fontWeight: FontWeight.w400,
                                          color: !model.isOnDark
                                              ? Colors.blue
                                              : Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 22),
                                      TextFormWidget(
                                        hint: 'Name',
                                        hintColor: !model.isOnDark
                                            ? Colors.black
                                            : Colors.white,
                                        label: 'Enter full name',
                                        labelStyle: TextStyle(
                                          color: !model.isOnDark
                                              ? Colors.grey
                                              : Colors.white,
                                        ),
                                        borderTopLeft: 12,
                                        borderTopRight: 12,
                                        borderBottomLeft: 12,
                                        borderBottomRight: 12,
                                        readOnly: model.updateProfile,
                                        isFilled: !model.isOnDark
                                            ? false
                                            : true,
                                        fillColor: !model.isOnDark
                                            ? Colors.white
                                            : Colors.white.withOpacity(.3),
                                        borderColor: Colors.blue,
                                        controller: nameController,
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
                                        validator:
                                            AppValidator.validateString(),
                                      ),
                                      SizedBox(height: 20),
                                      TextFormWidget(
                                        hint: 'Email',
                                        hintColor: !model.isOnDark
                                            ? Colors.black
                                            : Colors.white,
                                        label: 'Enter email address',
                                        labelStyle: TextStyle(
                                          color: !model.isOnDark
                                              ? Colors.grey
                                              : Colors.white,
                                        ),
                                        borderTopLeft: 12,
                                        borderTopRight: 12,
                                        borderBottomLeft: 12,
                                        borderBottomRight: 12,
                                        readOnly: model.updateProfile,
                                        isFilled: !model.isOnDark
                                            ? false
                                            : true,
                                        fillColor: !model.isOnDark
                                            ? Colors.white
                                            : Colors.white.withOpacity(.3),
                                        borderColor: Colors.blue,
                                        controller: emailController,
                                        validator: AppValidator.validateEmail(),
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
                                      SizedBox(height: 20),
                                      TextFormWidget(
                                        hint: 'Address',
                                        hintColor: !model.isOnDark
                                            ? Colors.black
                                            : Colors.white,
                                        label: 'Enter business address',
                                        labelStyle: TextStyle(
                                          color: !model.isOnDark
                                              ? Colors.grey
                                              : Colors.white,
                                        ),
                                        borderTopLeft: 12,
                                        borderTopRight: 12,
                                        borderBottomLeft: 12,
                                        borderBottomRight: 12,
                                        readOnly: model.updateProfile,
                                        isFilled: !model.isOnDark
                                            ? false
                                            : true,
                                        fillColor: !model.isOnDark
                                            ? Colors.white
                                            : Colors.white.withOpacity(.3),
                                        borderColor: Colors.blue,
                                        controller: addressController,
                                        validator:
                                            AppValidator.validateString(),
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
                                      SizedBox(height: 20),
                                      TextFormWidget(
                                        hint: 'Country',
                                        hintColor: !model.isOnDark
                                            ? Colors.black
                                            : Colors.white,
                                        label: 'Enter your country',
                                        readOnly: model.updateProfile,
                                        labelStyle: TextStyle(
                                          color: !model.isOnDark
                                              ? Colors.grey
                                              : Colors.white,
                                        ),
                                        borderTopLeft: 12,
                                        borderTopRight: 12,
                                        borderBottomLeft: 12,
                                        borderBottomRight: 12,
                                        isFilled: !model.isOnDark
                                            ? false
                                            : true,
                                        fillColor: !model.isOnDark
                                            ? Colors.white
                                            : Colors.white.withOpacity(.3),
                                        borderColor: Colors.blue,
                                        controller: countryController,
                                        validator:
                                            AppValidator.validateString(),
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
                                      SizedBox(height: 20),
                                      TextFormWidget(
                                        hint: 'State',
                                        hintColor: !model.isOnDark
                                            ? Colors.black
                                            : Colors.white,
                                        label: 'Enter your state',
                                        readOnly: model.updateProfile,
                                        labelStyle: TextStyle(
                                          color: !model.isOnDark
                                              ? Colors.grey
                                              : Colors.white,
                                        ),
                                        borderTopLeft: 12,
                                        borderTopRight: 12,
                                        borderBottomLeft: 12,
                                        borderBottomRight: 12,
                                        isFilled: !model.isOnDark
                                            ? false
                                            : true,
                                        fillColor: !model.isOnDark
                                            ? Colors.white
                                            : Colors.white.withOpacity(.3),
                                        borderColor: Colors.blue,
                                        controller: stateController,
                                        validator:
                                            AppValidator.validateString(),
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
                                      SizedBox(height: 20),
                                      TextFormWidget(
                                        hint: 'Local Govt Area',
                                        hintColor: !model.isOnDark
                                            ? Colors.black
                                            : Colors.white,
                                        label: 'Enter your LGA',
                                        labelStyle: TextStyle(
                                          color: !model.isOnDark
                                              ? Colors.grey
                                              : Colors.white,
                                        ),
                                        borderTopLeft: 12,
                                        borderTopRight: 12,
                                        borderBottomLeft: 12,
                                        borderBottomRight: 12,
                                        readOnly: model.updateProfile,
                                        isFilled: !model.isOnDark
                                            ? false
                                            : true,
                                        fillColor: !model.isOnDark
                                            ? Colors.white
                                            : Colors.white.withOpacity(.3),
                                        borderColor: Colors.blue,
                                        controller: lgaController,
                                        validator:
                                            AppValidator.validateString(),
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

                                      SizedBox(height: 50),
                                      ButtonWidget(
                                        border: 10,
                                        buttonColor: Colors.blue,
                                        buttonText: model.updateProfile
                                            ? 'Tap to Update'
                                            : 'Update',
                                        color: Colors.white,
                                        buttonBorderColor: Colors.transparent,
                                        isLoading: model.isLoading,
                                        onPressed: model.updateProfile
                                            ? () {
                                                model.updateProfile = false;
                                                model.notifyListeners();
                                              }
                                            : () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  model.updateUser(
                                                    context,
                                                    update:
                                                        UpdatePharmacyProfileEntityModel(
                                                          country:
                                                              countryController
                                                                  .text
                                                                  .trim(),
                                                          state: stateController
                                                              .text
                                                              .trim(),
                                                          lga: lgaController
                                                              .text
                                                              .trim(),
                                                          businessAddress:
                                                              addressController
                                                                  .text
                                                                  .trim(),
                                                          contactPersonName:
                                                              nameController
                                                                  .text
                                                                  .trim(),
                                                          contactEmail:
                                                              emailController
                                                                  .text
                                                                  .trim(),
                                                          servicesOffered: [],
                                                          bankDetails: [],
                                                        ),
                                                  );
                                                }
                                              },
                                      ),
                                      SizedBox(height: 30),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
