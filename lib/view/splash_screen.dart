// ignore_for_file: unused_import, unused_field, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salorify/view/home_screen.dart';
import 'package:salorify/view/login_and_signup/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void toGo() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Future.delayed(Duration(milliseconds: 1000), () async {

      bool? isLoggedIn = await sharedPreferences.getBool("loggedIn");
      String mobileNo = await sharedPreferences.getString("mobileNo").toString();
      /*Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          HomeScreen(number: '7027527585',)), (Route<dynamic> route) => false);*/
      if(isLoggedIn == null){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            LoginScreen()), (Route<dynamic> route) => false);
      }else{
        if (!isLoggedIn ) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              LoginScreen()), (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              HomeScreen(number: mobileNo,)), (Route<dynamic> route) => false);
        }
      }
    });

  }

  @override
  void initState() {
    super.initState();
    toGo();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 190,
                        height: 190,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/logo.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
          const Text(
            'Version 1.0.0',
            style: TextStyle(
                fontFamily: 'poppins', fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
