import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salorify/api_function.dart';
import 'package:salorify/controller/authentication_controller.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/model/user_data_model.dart';
import 'package:salorify/view/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  final String otp;
  final String mobileNo;

  const OtpScreen({super.key, required this.otp, required this.mobileNo});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final LoginController loginController = Get.put(LoginController());
  final ApiFunction apiFunction = Get.put(ApiFunction());
  final DashBoardController dashBoardController = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          children: [
            SizedBox(
              height: 10.0.h,
            ),
            Text('Sign In',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w900,fontSize: 25.sp),maxLines: 1,textAlign: TextAlign.left),
            SizedBox(
              height: 3.0.h,
            ),
            Text(
              'Enter your number and we will send OTP to verify',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.normal,
                  fontSize: 17.sp,
                  letterSpacing: 1.0
              ),
              textAlign: TextAlign.left,
              maxLines: 2,
            ),

            AbsorbPointer(
              absorbing: dashBoardController.loading,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.0.h),
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(
                    horizontal: 1.0.w,
                    vertical: 1.0.h),
                child: OtpTextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  numberOfFields: 6,
                  borderColor: Colors.orangeAccent,
                  focusedBorderColor: Colors.orangeAccent,
                  disabledBorderColor: Colors.orangeAccent,
                  enabledBorderColor: Colors.orangeAccent,
                  keyboardType: TextInputType.number,
                  showFieldAsBox: false,
                  cursorColor: Colors.orangeAccent,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  onSubmit: (String verificationCode) {
                    loginController.enteredOtp = verificationCode;
                  }, // end onSubmit
                ),
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            AbsorbPointer(
              absorbing: dashBoardController.loading,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0.w,),
                    padding: EdgeInsets.symmetric(horizontal: 1.0.w,vertical: 1.5.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        border: Border.all(color: Colors.white),
                        color: Colors.orangeAccent
                    ),
                    child: Center(
                      child: dashBoardController.loading == true? Center(
                        child: LoadingAnimationWidget.prograssiveDots(
                            color: Colors.white,
                            size: 25.0),)
                          : Text('Sign In',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  onTap: ()async{
                    setState(() {

                    });
                    if(loginController.enteredOtp == widget.otp){
                      List<UserData> userData = await dashBoardController.getUserData(widget.mobileNo.removeAllWhitespace);
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      await sharedPreferences.setBool("loggedIn", true);
                      await sharedPreferences.setString("mobileNo", widget.mobileNo.removeAllWhitespace);
                      await sharedPreferences.setString("member", userData[0].indosNo);
                      dashBoardController.loading = false;
                      setState(() {

                      });
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(number: widget.mobileNo.removeAllWhitespace,)),
                              (Route<dynamic> route) => false);

                    }else{
                      dashBoardController.loading = false;
                      Get.forceAppUpdate();
                      Get.back();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter correct OTP')));
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
