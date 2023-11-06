import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignou_project/utils/storage_service.dart';
import '../route/app_pages.dart';
import 'app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'app_constants.dart';

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
  static void getLogoutDialog(context) {
    Platform.isAndroid
        ? Get.dialog(
      AlertDialog(
        title: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            child: Text(AppConstants.yes),
            onPressed: () {
              Navigator.of(Get.overlayContext!, rootNavigator: true)
                  .pop(AppConstants.logout);                    //  Get.back();
              StorageService().clearData();
              Get.offNamedUntil(Routes.login, (route) => false);
            },
          ),
          TextButton(
            child: Text(AppConstants.no),
            onPressed: () {
              Navigator.of(Get.overlayContext!, rootNavigator: true)
                  .pop(AppConstants.logout);                  },
          ),
        ],
      ),
      barrierDismissible: false,
    )
        : Get.dialog(
      CupertinoAlertDialog(
        title: Text('Are you sure you want to logout?'),
        actions: [
          CupertinoDialogAction(
            child: Text(AppConstants.yes),
            onPressed: () {
              Navigator.of(Get.overlayContext!, rootNavigator: true)
                  .pop(AppConstants.logout);
              StorageService().clearData();
              Get.offNamedUntil(Routes.login, (route) => false);
            },
          ),
          CupertinoDialogAction(
            child: Text(AppConstants.no),
            onPressed: () {
              Navigator.of(Get.overlayContext!, rootNavigator: true)
                  .pop(AppConstants.logout);                  },
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static String convertiEnDateEtHeure(n) {
    String date = DateFormat('yyyy-MM-dd').format(n);
    return date;
  }
  static DateTime convertiEnDateEtHeure1(String date) {
    return DateFormat('yyyy-MM-dd').parse(date);
  }


  static showToast(message) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 15.0);

  static addSmallGap10() {
    return SizedBox(
      height: 10.sp,
    );
  }

  static addSmallGap5() {
    return SizedBox(
      height: 5,
    );
  }

  static addGap15() {
    return SizedBox(
      height: 15.sp,
    );
  }

  static addMediumGap() {
    return SizedBox(
      height: 20.sp,
    );
  }

  static addGap(int size) {
    return SizedBox(
      height: size.sp,
    );
  }
  static addVerBox({double size = 10}) {
    return SizedBox(
      height: size.sp,
    );
  }

  static addHorBox({size = 10.0}) {
    return SizedBox(
      width: size,
    );
  }
}
