import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salorify/constant/custom_appbar.dart';
import 'package:salorify/controller/dashboard_controller.dart';
import 'package:salorify/model/user_data_model.dart';

class StaticAppBar extends StatelessWidget {
  final String number;
  final DashBoardController dashBoardController;
  const StaticAppBar({super.key, required this.number, required this.dashBoardController});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserData>>(
        future: dashBoardController.getUserData(number),
        builder: (context,AsyncSnapshot<List<UserData>> d) {
          if (!d.hasData || d.hasError) {
            return Container(
                height: 20.0.h,
                width: 100.0.w,
                padding: EdgeInsets.symmetric(
                    horizontal: 5.0.w, vertical: 2.0.h),
                child: Center(
                  child: LoadingAnimationWidget.prograssiveDots(
                      color: Colors.orange, size: 25.0
                  ),
                )
            );
          } else {
            return CustomAppBar(
                profileIconUrl: d.data![0].pic ?? '',
                profileName: d.data![0].fullName,
                age: d.data![0].age == 0 ? '' : d.data![0].age.toString(),
                designation: d.data![0].designation ?? '',
              number: d.data![0].mobileNumber,
            );
          }
        }
    );
  }
}
