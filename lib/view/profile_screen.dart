import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salorify/view/login_and_signup/kyc_screen.dart';
import 'package:salorify/view/login_and_signup/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  final String number;
  const ProfileScreen({super.key, required this.number});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
                child: Icon(Icons.model_training,color: Colors.white,)),
            title: Text(
              'My Training',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18.sp
              ),
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateKyc(number: widget.number)));
            },
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
                child: Icon(Icons.verified_user,color: Colors.white,)),
            title: Text(
              'My KYC Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18.sp
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.settings,color: Colors.white,)),
            title: Text(
              'Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18.sp
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.person_add_alt_1_sharp,color: Colors.white,)),
            title: Text(
              'Invite Friends',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18.sp
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.headphones,color: Colors.white,)),
            title: Text(
              'Help Center',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18.sp
              ),
            ),
            ),
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.info,color: Colors.white,)),
              title: Text(
                'About Us',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18.sp
                ),
              ),
            ),
            ListTile(
              onTap: ()async{

                try{
                  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  bool isLoggedIn = await sharedPreferences.setBool("loggedIn",false);
                  var mobileNo = await sharedPreferences.setString("mobileNo",'');
                  print('false');
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()),
                          (Route<dynamic> route) => false);
                }catch(e){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something Went Wrong')));
                }
              },
              leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.logout,color: Colors.white,)),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18.sp
                ),
              ),
            ),
        ],
      ),
    );
  }
}
