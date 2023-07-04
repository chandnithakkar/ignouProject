import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class U {
  static loader(context) {
    return Center(
      child: Container(
        height: 60.0,
        width: 60.0,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white24, borderRadius: BorderRadius.circular(30)),
        child: const CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(
            CC.gradientCenter,
          ),
        ),
      ),
    );
  }

  static addVerBox({double size = 10}) {
    return SizedBox(
      height: size.sp,
    );
  }

  static addHorBox({size = 10}) {
    return SizedBox(
      width: size.sp,
    );
  }
}
