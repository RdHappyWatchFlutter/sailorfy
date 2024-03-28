import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Responsive extends StatelessWidget {
  final Widget child;

  const Responsive({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          child: child,
          height: 100.0.h,
          width: 100.0.w,
        )
    );
  }
}
