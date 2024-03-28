import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salorify/constant/responsive.dart';
import 'package:salorify/controller/authentication_controller.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/model/login_model.dart';
import 'package:salorify/view/login_and_signup/otp_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final LoginController loginController = Get.put(LoginController());
  final DashBoardController dashBoardController = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    return Responsive(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w,),
          children: [
            SizedBox(
              height: 10.0.h,
            ),
            Text('Sign Up',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w900,fontSize: 25.sp),maxLines: 1,textAlign: TextAlign.left),
            SizedBox(
              height: 3.0.h,
            ),
            Text(
              'Enter the following details for signing up',
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
              height: 2.0.h,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 20),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: loginController.fullNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Color(0xFF000000)),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Color(0xFF000000)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Color(0xFF000000)),
                  ),
                ),
                  validator: (value) {
                  if(value!.isEmpty){
                    return 'Enter Your Name';
                  }
                  return null;
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 20),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: loginController.indosNoController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Indos Number',
                  border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Color(0xFF000000)),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Color(0xFF000000)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Color(0xFF000000)),
                  ),
                ),

                  validator: (value) {
                    if(value!.isEmpty){
                      return 'Enter Your Indos Number';
                    }
                    return null;
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 20),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: loginController.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Color(0xFF000000)),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Color(0xFF000000)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Color(0xFF000000)),
                  ),
                ),

                  validator: (value) {
                    if(value!.isEmpty){
                      return 'Enter Your Email';
                    }
                    return null;
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 20),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: loginController.mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Color(0xFF000000)),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Color(0xFF000000)),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12),
                    child: Text(
                      '+91',
                      style: TextStyle(
                          color:Colors.black, letterSpacing: 1.0, fontSize: 15,  fontWeight: FontWeight.w500),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Color(0xFF000000)),
                  ),
                ),

                  validator: (value) {
                    if(value!.isEmpty){
                      return 'Enter Your Mobile Number';
                    }
                    return null;
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 20),
              child: InkWell(
                onTap: () async {
                  DateTime? dob = await showDatePicker(
                    context: context,
                    firstDate: DateTime(01,01,1900),
                    lastDate: DateTime.now(),
                  );
                  if(dob != null){
                    loginController.dob = dob;
                    Get.forceAppUpdate();
                  }else{
                    return;
                  }
                },
                child: Container(
                  // width: MediaQuery.of(context).size.width - 40,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(10)),
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'D.O.B - ${DateFormat('dd-MM-yyyy').format(loginController.dob ??DateTime.now())}',
                          style: TextStyle(color: Colors.black, letterSpacing: 1.0,
                              fontSize: 15, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 20),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: loginController.designationController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Designation',
                  border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Color(0xFF000000)),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Color(0xFF000000)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    const BorderSide(color: Color(0xFF000000)),
                  ),
                ),

                  validator: (value) {
                    if(value!.isEmpty){
                      return 'Enter Your Designation';
                    }
                    return null;
                  }
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),

          ],
        ),
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          height: 10.0.h,
          elevation: 0.0,
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
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
                        :  Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp
                      ),
                    ),
                  ),
                ),
              ),
              onTap: ()async{
                if(loginController.fullNameController.text.isNotEmpty
                    && loginController.emailController.text.isNotEmpty
                    && loginController.indosNoController.text.isNotEmpty
                    && loginController.mobileController.text.isNotEmpty){
                  dashBoardController.loading = true;
                  setState(() {

                  });
                  try{
                   var userData = await dashBoardController.getUserData(
                       loginController.mobileController.text.removeAllWhitespace);
                   if(userData.isEmpty){
                     loginController.otp = await loginController.get6DigitNumber();
                     LoginResponse loginResponse = await loginController.sendOtp(
                         loginController.mobileController.text.removeAllWhitespace,loginController.otp);
                     if(loginResponse.code == 200) {

                       var response = await loginController.signUp(
                           loginController.fullNameController.text,
                           loginController.emailController.text,
                           loginController.indosNoController.text,
                           loginController.mobileController.text);
                       if(response.statusCode == 200){
                         dashBoardController.loading = false;
                         setState(() {

                         });
                         Navigator.push(context, MaterialPageRoute(
                             builder: (context) => OtpScreen(
                               otp: loginController.otp,
                               mobileNo: loginController.mobileController.text,)));

                       }else if(response.statusCode == 409){
                         dashBoardController.loading = false;
                         setState(() {

                         });
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                             'User already exist'),
                           backgroundColor: Colors.red,));
                       }else{
                         dashBoardController.loading = false;
                         setState(() {

                         });
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                             'Something went wrong.'),
                           backgroundColor: Colors.red,));
                       }
                       dashBoardController.loading = false;
                       setState(() {

                       });

                     }else{
                       dashBoardController.loading = false;
                       setState(() {

                       });
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Entered OTP is wrong')));
                     }
                   }else{
                     dashBoardController.loading = false;
                     print('dashBoardController.loading');
                     setState(() {

                     });
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                         'User already exist'),
                       backgroundColor: Colors.red,));
                   }
                  }catch(e){
                    print('e');
                    print(e);
                    dashBoardController.loading = false;
                    setState(() {

                    });
                  }
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(
                      'All fields are required'
                    ),
                    backgroundColor: Colors.red,)
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
