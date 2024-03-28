import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salorify/controller/authentication_controller.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/model/user_data_model.dart';

class EditProfile extends StatefulWidget {
  final String number;
  const EditProfile({super.key, required this.number});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){}, child: Text(
            'Done',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0
            ),
          ))
        ],
      ),
      body: FutureBuilder<List<UserData>>(
        future: DashBoardController().getUserData(widget.number),
        initialData: [],
        builder: (context,AsyncSnapshot<List<UserData>> d) {
          if(!d.hasData || d.hasError){
            return Center(
              child: LoadingAnimationWidget.prograssiveDots(
                  color: Colors.orange,
                  size: 40.sp
              ),
            );
          }else if(d.hasData){
            if(d.data!.isNotEmpty){

              loginController.fullNameController.text = d.data![0].fullName;
              loginController.indosNoController.text = d.data![0].indosNo;
              loginController.emailController.text = d.data![0].emailId;
              loginController.mobileController.text = d.data![0].mobileNumber;
              loginController.dob = DateTime.parse(d.data![0].dob == ''?DateTime.now().toIso8601String():d.data![0].dob);
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 2.0.h),
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        minRadius: 40.sp,
                        maxRadius: 40.sp,
                        backgroundColor: Colors.blueGrey,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: CircleAvatar(
                            minRadius: 40.sp,
                            maxRadius: 40.sp,
                            backgroundImage: CachedNetworkImageProvider(
                                "https://sailorfy.searchosis.com/${d.data![0].photo}"
                            ),

                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 10.0,
                          right: 100.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.camera_alt),),
                          )
                      )
                    ],
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

                ],
              );
            }else{
              return Center(
                child: LoadingAnimationWidget.prograssiveDots(
                    color: Colors.orange,
                    size: 30.sp
                ),
              );
            }
          }else{
            return Center(
              child: LoadingAnimationWidget.prograssiveDots(
                  color: Colors.orange,
                  size: 40.sp
              ),
            );
          }
        }
      ),
    );
  }
  @override
  void dispose() {
    print('disposed');
    loginController.disposeControllers();
    super.dispose();
  }
}
