// ignore_for_file: deprecated_member_use, must_be_immutable, unnecessary_null_comparison

import 'package:assessment/core/core_folder/app/app.router.dart';
import 'package:assessment/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import 'core/connect_end/viewmodel/viewmodel.dart';
import 'widgets/text.dart';

class DashoardScreen extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  DashoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewModel>.reactive(
      viewModelBuilder: () => ViewModel(),
      onViewModelReady: (model) async {
        await model.getSaveSharedPreferenceDarkMode();
        model.getTenant(context);
      },
      disposeViewModel: false,
      builder: (_, ViewModel model, _) {
        return Scaffold(
          backgroundColor: !model.isOnDark ? Colors.white : Colors.black,

          body: Stack(
            children: [
              Positioned(
                top: -30,
                left: 300,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(100),
                    decoration: BoxDecoration(
                      color: !model.isOnDark ? Colors.white : Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -164.0,
                left: -121,
                child: Container(
                  padding: EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(100),
                    decoration: BoxDecoration(
                      color: !model.isOnDark ? Colors.white : Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      if (model.getTetantResponseModel != null &&
                              model.getTetantResponseModel!.data!.logo!.url !=
                                  '' ||
                          model.session.usersData != null)
                        GestureDetector(
                          onTap: () =>
                              navigate.navigateTo(Routes.profileScreen),
                          child: Card(
                            elevation: 3,
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 40.0,
                            ),
                            color: !model.isOnDark
                                ? Colors.white.withOpacity(.444)
                                : Colors.white.withOpacity(.012),
                            shadowColor: !model.isOnDark
                                ? Colors.white
                                : Colors.transparent,
                            surfaceTintColor:
                                Colors.transparent, // Material 3 fix
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: !model.isOnDark
                                    ? Colors.white
                                    : Colors
                                          .transparent, // 👈 controls "how white"
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.white.withOpacity(
                                    0.9,
                                  ), // optional glass border
                                ),
                              ),
                              padding: EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: CircleAvatar(
                                      radius: 44.4,
                                      backgroundColor: Colors.grey.shade200,
                                      child: ClipOval(
                                        child: Image.network(
                                          model
                                                  .session
                                                  .usersData['logo']?['url'] ??
                                              '',
                                          width: 88.8,
                                          height: 88.8,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return Image.asset(
                                                  'assets/image/profile.jpeg',
                                                  fit: BoxFit.cover,
                                                  width: 88.8,
                                                  height: 88.8,
                                                );
                                              },
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 20),
                                  TextView(
                                    text:
                                        model
                                            .getTetantResponseModel
                                            ?.data
                                            ?.contactPersonName ??
                                        model
                                            .session
                                            .usersData['contactPersonName'] ??
                                        '',
                                    textStyle: GoogleFonts.abel(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: !model.isOnDark
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                  TextView(
                                    text:
                                        model
                                            .getTetantResponseModel
                                            ?.data
                                            ?.tenantType ??
                                        model.session.usersData['tenantType'] ??
                                        '',
                                    textStyle: GoogleFonts.roboto(
                                      fontSize: 16.20,
                                      fontWeight: FontWeight.w500,
                                      color: !model.isOnDark
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                  TextView(
                                    text:
                                        model
                                            .getTetantResponseModel
                                            ?.data
                                            ?.contactEmail ??
                                        model
                                            .session
                                            .usersData['contactEmail'] ??
                                        '',
                                    textStyle: GoogleFonts.economica(
                                      fontSize: 18.20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  TextView(
                                    text:
                                        '${model.getTetantResponseModel?.data?.businessAddress ?? model.session.usersData['businessAddress'] ?? ''}, ${model.getTetantResponseModel?.data?.state ?? model.session.usersData['state'] ?? ''}, ${model.getTetantResponseModel?.data?.lga ?? model.session.usersData['lga'] ?? ''}',

                                    textStyle: GoogleFonts.cormorant(
                                      fontSize: 18.20,
                                      fontWeight: FontWeight.w500,
                                      color: !model.isOnDark
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),

                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (model.isLoading)
                        ...[
                          1,
                          2,
                          3,
                          4,
                          5,
                          6,
                        ].map((e) => _buildDashboardShimmer(model))
                      else
                        ...model.transactionList.map(
                          (e) => Padding(
                            padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Icon(
                                        Icons.bar_chart,
                                        color: Colors.blue,
                                        size: 24,
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text:
                                              'Transaction No: ${e.transactionNumber}',
                                          textStyle: GoogleFonts.abel(
                                            fontSize: 22.20,
                                            fontWeight: FontWeight.w400,
                                            color: !model.isOnDark
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        SizedBox(
                                          width: 300,
                                          child: TextView(
                                            text:
                                                'Description: ${e.description}',
                                            maxLines: 3,
                                            textStyle: GoogleFonts.roboto(
                                              fontSize: 15.80,
                                              fontWeight: FontWeight.w300,
                                              color: !model.isOnDark
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.black12.withOpacity(.0562),
                                ),
                              ],
                            ),
                          ),
                        ),
                      SizedBox(height: 30),
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

  Widget _buildDashboardShimmer(ViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 340,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            // Type
            Container(
              width: 300,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 6.10),

            // Email
            Container(
              width: 290,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
