import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salorify/view/login_and_signup/kyc_screen.dart';
import 'package:salorify/view/pages/edit_profile.dart';

class CustomAppBar extends StatelessWidget {
  final String profileIconUrl;
  final String profileName;
  final String designation;
  final String age;
  final String number;
  const CustomAppBar(
      {super.key,
      required this.profileIconUrl,
      required this.profileName,
      required this.age,
      required this.designation,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 26.0.h,
        width: 100.0.w,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(
          horizontal: 5.0.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              height: 5.0.h,
              child: ListTile(
                title: Text(
                  'Your KYC details are not verified',
                  style: TextStyle(color: Colors.black, fontSize: 14.sp),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateKyc(
                                  number: number,
                                )));
                  },
                  child: Text(
                    'Complete\nKYC',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 3.0.h,
                  backgroundImage: CachedNetworkImageProvider(
                      'https://sailorfy.searchosis.com' + '/files/inno.png',
                      errorListener: (obj) {
                    Container();
                  }),
                ),
                SizedBox(
                  width: 2.0.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome, ${profileName.capitalize.toString()}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.0)),
                      designation.isNotEmpty && age.isNotEmpty
                          ? Text(
                              '${designation.capitalizeFirst.toString()}, ${age}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500))
                          : Container(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                        number: number,
                                      )));
                        },
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_active_outlined)),
                IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
              ],
            ),
            Container(
              height: 6.0.h,
              margin: EdgeInsets.only(top: 10, bottom: 5),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54)),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                    filled: true,
                    fillColor: Colors.white),
              ),
            )
          ],
        ));
  }
}
