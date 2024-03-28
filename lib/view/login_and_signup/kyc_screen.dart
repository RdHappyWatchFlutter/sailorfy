import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salorify/controller/authentication_controller.dart';
import 'package:salorify/controller/kyc_controller.dart';

import '../../controller/dashboard_controller.dart';
import '../../model/user_data_model.dart';

class UpdateKyc extends StatefulWidget {
  final String number;
  const UpdateKyc({super.key, required this.number});

  @override
  State<UpdateKyc> createState() => _UpdateKycState();
}

class _UpdateKycState extends State<UpdateKyc> {
  final DashBoardController dashBoardController =
  Get.put(DashBoardController());
  bool loading = false;

  final KycController kycController = Get.put(KycController());
  Future<List<UserData>>? _userDataFuture;

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
    });
    kycController.getUserDetails();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update your Kyc',
          ),
          centerTitle: true,
        ),
        body: loading
            ? Center(
          child: LoadingAnimationWidget.prograssiveDots(
              color: Colors.orange, size: 40.0),
        )
            : SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0.h),
            child: Column(
              children: [
                Form(
                  key: kycController.formPrimaryDetails,
                  child: ExpansionTile(
                    title: const Text(
                      'Primary Details',
                    ),
                    collapsedBackgroundColor: Colors.grey,
                    childrenPadding: EdgeInsets.all(10.0),
                    trailing: TextButton(
                      onPressed: () {
                        try {
                          kycController.loadingPrimary = true;
                          setState(() {});
                          if (kycController.dob.text.isNotEmpty) {
                            kycController.updateKyc({
                              "dob": kycController.dob.text,
                            }, "Primary Details Updated", context);
                          }
                        } catch (e) {
                          log(e.toString());
                        } finally {
                         kycController.loadingPrimary = false;
                          setState(() {});
                        }
                      },
                      child: kycController.loadingPrimary
                          ? LoadingAnimationWidget.prograssiveDots(
                          color: Colors.orange, size: 20.0)
                          : const Text(
                        'Save',
                        maxLines: 1,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: kycController.fullNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                          enabled: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          enabled: false,
                          textInputAction: TextInputAction.next,
                          controller: kycController.indosNumberController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Indos Number',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          enabled: false,
                          textInputAction: TextInputAction.next,
                          controller: kycController.emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email ID',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          enabled: false,
                          textInputAction: TextInputAction.next,
                          controller: kycController.mobileController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 12),
                              child: Text(
                                '+91',
                                style: TextStyle(
                                    color: Colors.black26,
                                    letterSpacing: 1.0,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: kycController.dob,
                          keyboardType: TextInputType.text,
                          readOnly: true,
                          onTap: () async {
                            DateTime? dobVal = await showDatePicker(
                              context: context,
                              firstDate: DateTime(01, 01, 1900),
                              lastDate: DateTime.now(),
                            );
                            if (dobVal != null) {
                              kycController.dob.text =
                                  DateFormat('yyyy-MM-dd').format(dobVal);
                              Get.forceAppUpdate();
                            } else {
                              return;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'D.O.B',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                Form(
                  key: kycController.formAddress,
                  child: ExpansionTile(
                    title: const Text(
                      'Address',
                    ),
                    collapsedBackgroundColor: Colors.grey,
                    childrenPadding: const EdgeInsets.all(10.0),
                    trailing: TextButton(
                      onPressed: () {
                        try {
                          setState(() {
                            kycController.loadingAddress = true;
                          });
                          Map body = {
                            "nearest_airport": kycController
                                .nearestAirportController.text,
                            "nationality":
                            kycController.nationalityController.text,
                            "city_of_birth":
                            kycController.cityOfBirthController.text,
                            "state_of_birth":
                            kycController.stateOfBirthController.text,
                          };
                          body.removeWhere((key, value) => value.isEmpty);
                          if (body.isNotEmpty) {
                            kycController.updateKyc(
                                body, "Address Details Updated", context);
                          }
                        } catch (e) {
                          log(e.toString());
                        } finally {
                          setState(() {
                            kycController.loadingAddress = false;
                          });
                        }
                      },
                      child: kycController.loadingAddress
                          ? LoadingAnimationWidget.prograssiveDots(
                          color: Colors.orange, size: 20.0)
                          : const Text(
                        'Save',
                        maxLines: 1,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller:
                          kycController.nearestAirportController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Nearest Airport',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: kycController.nationalityController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Nationality',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: kycController.cityOfBirthController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'City of Birth',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller:
                          kycController.stateOfBirthController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'State of Birth',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                Form(
                  key: kycController.passporFrom,
                  child: ExpansionTile(
                    title: const Text(
                      'Passport',
                    ),
                    collapsedBackgroundColor: Colors.grey,
                    childrenPadding: EdgeInsets.all(10.0),
                    trailing: TextButton(
                      onPressed: () {
                        try {
                          setState(() {
                            kycController.loadingPassport = true;
                          });
                          Map body = {
                            "passport_number": kycController
                                .passportNumberController.text,
                            "passport_date_of_issue":
                            kycController.passportDateOfIssue.text,
                            "passport_date_of_expiry":
                            kycController.passportDateOfExpiry.text,
                            "passport_pic": kycController.passportPic,
                          };
                          body.removeWhere((key, value) => value.isEmpty);
                          if (body.isNotEmpty) {
                            kycController.updateKyc(body,
                                "Passport Details Updated", context);
                          }
                        } catch (e) {
                          print(e);
                        } finally {
                          setState(() {
                            kycController.loadingPassport = false;
                          });
                        }
                      },
                      child: kycController.loadingPassport == true
                          ? LoadingAnimationWidget.prograssiveDots(
                          color: Colors.orange, size: 20.0)
                          : Text(
                        'Save',
                        maxLines: 1,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller:
                          kycController.passportNumberController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Passport Number',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: kycController.passportDateOfIssue,
                          keyboardType: TextInputType.text,
                          readOnly: true,
                          onTap: () async {
                            DateTime? dobVal = await showDatePicker(
                              context: context,
                              firstDate: DateTime(01, 01, 1900),
                              lastDate: DateTime.now(),
                            );
                            if (dobVal != null) {
                              kycController.passportDateOfIssue.text =
                                  DateFormat('yyyy-MM-dd').format(dobVal);
                              ;
                            } else {
                              return;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Passport Issue Date',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: kycController.passportDateOfExpiry,
                          keyboardType: TextInputType.text,
                          readOnly: true,
                          onTap: () async {
                            DateTime? dobVal = await showDatePicker(
                              context: context,
                              firstDate: DateTime(01, 01, 1900),
                              lastDate: DateTime.now(),
                            );
                            if (dobVal != null) {
                              kycController.passportDateOfExpiry.text =
                                  DateFormat('yyyy-MM-dd').format(dobVal);
                              ;
                            } else {
                              return;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Passport Issue Date',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(
                                    8.0) //                 <--- border radius here
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  elevation: 2,
                                  child: TextButton(
                                      onPressed: () async {
                                        String path =
                                        await dashBoardController
                                            .getImage(context,
                                            ImageSource.camera);
                                        if (path != 'error') {
                                          kycController.passportPic =
                                              path;
                                        }
                                      },
                                      child: const Text(
                                        'Upload Passport Image',
                                        style: TextStyle(
                                            color: Colors.black),
                                        maxLines: 2,
                                      )),
                                ),
                                kycController.passportPic == ''
                                    ? Text('No file Selected')
                                    : Expanded(
                                  child: Text(
                                    kycController.passportPic
                                        .toString(),
                                    maxLines: 3,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                Form(
                  key: kycController.formSeamanBook,
                  child: ExpansionTile(
                    title: const Text(
                      "Seaman's Book",
                    ),
                    collapsedBackgroundColor: Colors.grey,
                    childrenPadding: EdgeInsets.all(10.0),
                    trailing: TextButton(
                      onPressed: () {
                        try {
                          setState(() {
                            kycController.loadingSeaman = true;
                          });
                          Map body = {
                            "seaman_book_no":
                            kycController.seamanBookNoController.text,
                            "seaman_date_of_issue":
                            kycController.seamenDateOfIssue.text,
                            "seaman_date_of_expiry":
                            kycController.seamenDateOfExpiry.text,
                            "seaman_country_of_issue":
                            kycController.seamanCountryOfIssue.text,
                            "seaman_pic": kycController.seamanPic,
                          };
                          body.removeWhere((key, value) => value.isEmpty);
                          if (body.isNotEmpty) {
                            kycController.updateKyc(body,
                                "Seaman's Book Details Updated", context);
                          }
                        } catch (e) {
                          log(e.toString());
                        } finally {
                          setState(() {
                            kycController.loadingSeaman = false;
                          });
                        }
                      },
                      child: kycController.loadingSeaman == true
                          ? LoadingAnimationWidget.prograssiveDots(
                          color: Colors.orange, size: 20.0)
                          : const Text(
                        'Save',
                        maxLines: 1,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: kycController.fullNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Seamen Book no.',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: kycController.seamenDateOfIssue,
                          keyboardType: TextInputType.text,
                          readOnly: true,
                          onTap: () async {
                            DateTime? dobVal = await showDatePicker(
                              context: context,
                              firstDate: DateTime(01, 01, 1900),
                              lastDate: DateTime.now(),
                            );
                            if (dobVal != null) {
                              kycController.seamenDateOfIssue.text =
                                  DateFormat('yyyy-MM-dd').format(dobVal);
                              ;
                            } else {
                              return;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Seaman Issue Date',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: kycController.seamenDateOfExpiry,
                          keyboardType: TextInputType.text,
                          readOnly: true,
                          onTap: () async {
                            DateTime? dobVal = await showDatePicker(
                              context: context,
                              firstDate: DateTime(01, 01, 1900),
                              lastDate: DateTime.now(),
                            );
                            if (dobVal != null) {
                              kycController.seamenDateOfExpiry.text =
                                  DateFormat('yyyy-MM-dd').format(dobVal);
                              ;
                            } else {
                              return;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Seaman Expiry Date.',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: kycController.seamanCountryOfIssue,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Seaman Country Of Issue',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF000000)),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xFF000000)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(
                                    8.0) //                 <--- border radius here
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  elevation: 2,
                                  child: TextButton(
                                      onPressed: () async {
                                        String path =
                                        await dashBoardController
                                            .getImage(context,
                                            ImageSource.camera);
                                        if (path != 'error') {
                                          kycController.seamanPic = path;
                                        }
                                      },
                                      child: const Text(
                                        'Upload Seaman Image',
                                        style: TextStyle(
                                            color: Colors.black),
                                        maxLines: 2,
                                      )),
                                ),
                                kycController.seamanPic == ''
                                    ? const Text('No file Selected')
                                    : Expanded(
                                  child: Text(
                                    kycController.seamanPic
                                        .toString(),
                                    maxLines: 3,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
