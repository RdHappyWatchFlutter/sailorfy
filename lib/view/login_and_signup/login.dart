import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salorify/api_function.dart';
import 'package:salorify/constant/responsive.dart';
import 'package:salorify/controller/authentication_controller.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/model/login_model.dart';
import 'package:salorify/view/login_and_signup/otp_screen.dart';
import 'package:salorify/view/login_and_signup/sign_up.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());
  final DashBoardController dashBoardController = Get.put(DashBoardController());
  final ApiFunction apiFunction = Get.put(ApiFunction());
  @override
  Widget build(BuildContext context) {
    return Responsive(
      child: Scaffold(
        body: ListView(
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

            SizedBox(
              height: 8.0.h,
            ),
            InternationalPhoneNumberInput(
              height: 5.0.h,
              controller: loginController.phoneNumberController,
              inputFormatters: const [],
              inactive: dashBoardController.loading,
              formatter: MaskedInputFormatter('### ### ## ##'),
              dialogConfig: DialogConfig(
              ),

              initCountry: CountryCodeModel(
                  name: "India", dial_code: "+91", code: "IN"),

              betweenPadding: 1.0.w,
              onInputChanged: (phone) {
/*                print(phone.code);
                print(phone.dial_code);
                print(phone.number);
                print(phone.rawFullNumber);
                print(phone.rawNumber);
                print(phone.rawDialCode);*/
                loginController.intPhoneNumber = phone;
                loginController.phoneNumberController.text = phone.number;
                setState(() {

                });
              },
              validator: (number) {
                if (number.number.isEmpty) {
                  return "The phone number cannot be left empty";
                }
                return null;
              },
            ),
            SizedBox(
              height: 3.0.h,
            ),

          ],
        ),
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          height: 11.0.h,
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          elevation: 0.0,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    height: 4.5.h,
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(5.0.h)
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: dashBoardController.loading == true
                            ? Center(
                          child: LoadingAnimationWidget.prograssiveDots(
                               color: Colors.white,
                               size: 25.0),)
                            : Text(
                          'Confirm',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    if(loginController.phoneNumberController.text.isNotEmpty){
                      dashBoardController.loading = true;
                      setState(() {

                      });
                      loginController.otp = await loginController.get6DigitNumber();
                      print(loginController.otp);
                      print(loginController.intPhoneNumber.number);
                      bool isRegistered = await loginController.checkUser(loginController.intPhoneNumber.number.removeAllWhitespace);
                      print(isRegistered);
                      if(isRegistered){
                        try{
                          LoginResponse loginResponse = await loginController.sendOtp(
                              loginController.intPhoneNumber.number.removeAllWhitespace,loginController.otp);
                          print('done');
                          if(loginResponse.code == 200) {
                            dashBoardController.loading = false;
                            setState(() {

                            });
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => OtpScreen(otp: loginController.otp, mobileNo: loginController.intPhoneNumber.number,)));
                          }else{
                            dashBoardController.loading = false;
                            setState(() {

                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User not found')));
                          }
                        }catch(e){
                          print(e);
                          Get.back();
                          dashBoardController.loading = false;
                          Get.forceAppUpdate();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong')));
                        }
                      }else{
                        dashBoardController.loading = false;
                        setState(() {

                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('User not Found'),
                              backgroundColor: Colors.redAccent,
                            )
                        );
                      }
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Phone number is required'),
                            backgroundColor: Colors.red,
                          )
                      );
                    }
                  },
                ),
                TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
